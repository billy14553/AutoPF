close all;

dataMat = ["wheatLV3","wheatLV5","wheatLV7"];
dataMat = ["meatLV3","meatLV5","meatLV7"];
strLegend = ["LV = 3","LV = 5","LV = 7"];
style1 = [":","-","--"];
xxx = [];
yyy = [];

for iii = 1:1:3
    load(dataMat(iii));
    times = t2-t1;
    dt = times/length(Configuration.RMSECV);

    xxx{iii} = [1:1:length(Configuration.RMSECV)]*dt;
    yyy{iii} = Configuration.RMSECV;
   % plot(fig1,0:dt:times-dt,Configuration.RMSECV,'LineWidth',1.5);
end
fig1 = figure;
hold on;
for iii = 1:1:3
    plot(xxx{iii},yyy{iii},'LineWidth',1.5,'LineStyle',style1(iii));
end
legend(strLegend);
SCIPlot;

ylabel("Loss function");
xlabel("Computation time (/s)");