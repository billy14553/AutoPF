%Configuration.Backbone = {smothingFuncs(),baselineFuncs(),scatterFuncs(),centeringFuncs(),scalingFuncs()};

funcs = [Configuration.Backbone{1},Configuration.Backbone{2},Configuration.Backbone{3},Configuration.Backbone{4}];
xarray = [[1,1,1,1,1];[2,1,1,1,1];[3,1,1,1,1];...
    [1,2,1,1,1];[1,3,1,1,1];[1,4,1,1,1];[1,5,1,1,1];[1,6,1,1,1];[1,7,1,1,1];[1,8,1,1,1];...%[1,9,1,1,1];[1,10,1,1,1];[1,11,1,1,1];[1,10,1,1,1];
    [1,1,2,1,1];[1,1,3,1,1];[1,1,4,1,1];obj.x1];

%function funcs = smothingFuncs()
% funcs  = {@none,@smothing_sgolay,@smothing_mw_average};%,,@smothing_cwt
%end
%selectMethods = [1,2,8,12,13,14];
% funcs  = {@none,@baseline_derivate1_1,...
%     @baseline_derivate1_3,@baseline_derivate1_4,@baseline_derivate2_2,...
%     @baseline_derivate2_3,@baseline_derivate2_4,@baseline_derivate2_5};%,@baseline_wls
% end
% funcs  = {@none,@scatter_snv2,@scatter_msc1,@scatter_emsc};

vsel = 1:size(X,2);
Methods = ["None","SG-15-0-2","smothing_mw_average",...
    "SG-15-1-1","SG-15-1-3","SG-15-1-4",...
    "SG-15-2-2","SG-15-2-3","SG-15-2-4","SG-15-2-5",...%"ALS100","ALS1000","ALS10000""ALS(p=0.01,l = 1000)",
    "SNV","MSC","EMSC","AutoPF"];
RMSECV = [];
Lvs = 1:10;
%figure;
%hold on;
for j = 1:1:size(xarray,1)
    x = xarray(j,:);        
    if j==size(xarray,1)
        vsel = obj.vsel;
    end
    for i = 1:1:length(Lvs)
        oldLvs = Configuration.LVs;
        Configuration.LVs = Lvs(i);
        obj1 = crossvalidate(X,y,x,vsel,0);
        Configuration.LVs = oldLvs;
        RMSECV(j,i) = obj1;
    end
   % plot(RMSECV(j,:));
    [a,b] = min(RMSECV(j,:));
    oldobj = obj;
    obj.vsel = 1:size(X,2);
    obj.x1 = xarray(j,:);
    oldLvs = Configuration.LVs;
    Configuration.LVs = b;
    if j==size(xarray,1) 
          obj.vsel = oldobj.vsel;
          model = Configuration;
          model.obj = obj;
          RMSEP(j) = comboPredict(model,Xtest,ytest);
    end
    model = Configuration;
    model.obj = obj;
    RMSEP(j) = comboPredict(model,Xtest,ytest);
    disp(sprintf("Method: %s,optimal LV:%d,RMSECV:%.3f,RMSEP:%.3f \n",Methods(j),b,a,RMSEP(j)));
    Configuration.LVs = oldLvs;
    obj = oldobj; 
end
selectMethods = [1,2,8,11,12,13,14];
style = ['o','s','d','v','^','<','p'];
colors = lines(20);
fig = figure;
hold on;
subRMSECV = RMSECV(selectMethods,:);
subMethods = Methods(selectMethods);
for i = 1:1:length(selectMethods)
    plot(RMSECV(selectMethods(i),:),'Marker',style(i),'LineWidth',1.5,'MarkerSize',6,'MarkerFaceColor',colors(i,:));
end
xlim([1,10]);
legend(subMethods);
ylabel("RMSECV");
xlabel("Number of latent variables");
SCIPlot;
%MySaveFig(fig,strcat(appname,"_RMSECV_COMPARE"));
%figure;





