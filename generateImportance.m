
Xtrain = X;
RMSECV2 = zeros(1,7);
RMSEP2 = zeros(1,7);
obj1 = obj;
obj1.x1 = 1;
RMSECV2(1) = crossvalidate(Xtrain,y,obj1.x1);
RMSEP2(1) = comboPredict(obj1,Xtest,ytest);
for k = 2:1:6 
    Xtrain = X;
    obj1 = obj;
    obj1.x1 = obj.x1(1:(k-1));
    RMSECV2(k) = crossvalidate(Xtrain,y,obj1.x1);
    RMSEP2(k) = comboPredict(obj1,Xtest,ytest);
end
fig = figure("Name","step","Color",'w');
RMSECV2(7) =  crossvalidate(Xtrain,y,obj1.x1,obj1.vsel);
RMSEP2(7) = comboPredict(obj1,Xtest,ytest);
data= [RMSECV2;RMSEP2];
GO = bar(data','EdgeColor','k','LineWidth',1);
hatchfill2(GO(1),'cross','HatchAngle',45, 'HatchDensity', 30, 'HatchColor', 'black');
hatchfill2(GO(2),'single','HatchAngle',0, 'HatchDensity', 30, 'HatchColor', 'black');
[legend_h, object_h, plot_h, text_str]=legendflex(GO,{'Train','Test'},'Padding', [2, 2, 10], 'FontSize', 12, 'Location', 'NorthEast');
hatchfill2(object_h(3),'cross','HatchAngle',45, 'HatchDensity', 7, 'HatchColor', 'black');
hatchfill2(object_h(4),'single','HatchAngle',0, 'HatchDensity', 7, 'HatchColor', 'black');
legend_h.LineWidth = 1.5;
strLabel = ["None"];
for k = 1:1:5
    strLabel = [strLabel func2str(Configuration.Backbone{k}{obj.x1(k)})];
end
strLabel =  [strLabel func2str(Configuration.extraWork{1}{obj.x2})];
xticklabels(strLabel);
xlabel("Preprocessing Methods",'Interpreter','none');
ylabel("Performance");
SCIPlot;