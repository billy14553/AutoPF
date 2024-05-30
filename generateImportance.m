
Xtrain = X;
RMSECV2 = zeros(1,7);
RMSEP2 = zeros(1,7);
obj1 = obj;
obj1.x1 = 1;

%if strcmp(appname,"meat")
    % Configuration.LVs = 9;
%elseif strcmp(appname,"wheat")
     %Configuration.LVs = 9;
%else
     
%end


RMSECV2(1) = crossvalidate(Xtrain,y,obj1.x1,1:size(Xtrain,2),0);
model = Configuration;
model.obj = obj1;

RMSEP2(1) = comboPredict(model,Xtest,ytest);
for k = 2:1:6 
    Xtrain = X;
    obj1 = obj;
    obj1.x1 = obj.x1(1:(k-1));
    RMSECV2(k) = crossvalidate(Xtrain,y,obj1.x1,1:size(Xtrain,2),0);
    model = Configuration;
    vselbak = obj1.vsel;
    obj1.vsel = 1:size(Xtrain,2);
    model.obj = obj1;
    RMSEP2(k) = comboPredict(model,Xtest,ytest);
    obj1.vsel = vselbak;
end
fig = figure("Name","step","Color",'w');
RMSECV2(7) =  crossvalidate(Xtrain,y,obj1.x1,obj1.vsel,0);
model = Configuration;
model.obj = obj1;
RMSEP2(7) = comboPredict(model,Xtest,ytest);
%factor = getPenalityFactor();

disp(appname);
data= [RMSECV2;RMSEP2];
if strcmp(appname,"meat")
    disp("match meat");
    strLabel = ["None","SG-15-2-5","SNV","RF"];
    data(:,[2,5,6]) = [];
 %   data(1,2) = data(1,2)/factor;
  %  data(1,3) = data(1,3)/factor^2;
   % data(1,4) = data(1,4)/factor^3;
elseif strcmp(appname,"wheat")
    disp("match wheat");
    strLabel = ["None","SG-15-2-2","EMSC"];
    % strLabel = ["None","SG-15-2-2","EMSC","Mean","CARS"];
     %data(:,[1,6]) = [];
    data(:,[2,5,6,7]) = [];
    %data(1,2) = data(1,2)/factor;
    %data(1,3) = data(1,3)/factor^2;
elseif strcmp(appname,"barley")
    disp("match wheat");
    strLabel = ["None","SG-15-1-3","EMSC"];
    data(:,[2,5,6,7]) = [];
    %data(1,2) = data(1,2)/factor;
    %data(1,3) = data(1,3)/factor^2;
else
    strLabel = ["None"];
    for k = 1:1:5
        strLabel = [strLabel func2str(Configuration.Backbone{k}{obj.x1(k)})];
    end
strLabel =  [strLabel func2str(Configuration.extraWork{1}{obj.x2})];
end

GO = bar(data','EdgeColor','k','LineWidth',1);
hatchfill2(GO(1),'cross','HatchAngle',45, 'HatchDensity', 30, 'HatchColor', 'black');
hatchfill2(GO(2),'single','HatchAngle',0, 'HatchDensity', 30, 'HatchColor', 'black');
[legend_h, object_h, plot_h, text_str]=legendflex(GO,{'RMSECV','RMSEP'},'Padding', [2, 2, 10], 'FontSize', 12, 'Location', 'NorthEast');
hatchfill2(object_h(3),'cross','HatchAngle',45, 'HatchDensity', 7, 'HatchColor', 'black');
hatchfill2(object_h(4),'single','HatchAngle',0, 'HatchDensity', 7, 'HatchColor', 'black');
legend_h.LineWidth = 1.5;
yl = ylim();
yl(1) = 0;
ylim(yl);
xticklabels(strLabel);
xlabel("Preprocessing Methods"+" (LV = "+Configuration.LVs+ ")",'Interpreter','none');
ylabel("Performance");
SCIPlot;
 
%MySaveFig(fig,strcat(appname,"_RMSECVP_penality"));