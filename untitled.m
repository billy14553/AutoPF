RMSECV = [0.462,0.462,0.469,0.469,0.469,0.469,0.469,0.469,0.469,0.469,0.469];
RMSEP = [0.425,0.425,0.403,0.403,0.403,0.403,0.403,0.403,0.403,0.403,0.403];
num = [4,3,2,2,2,2,2,2,2,2,2];
N = 1.0:0.01:1.10;

fig = figure("Name","Selection of N","Color",'w');  % 修正了"Slection"拼写错误

 
plot(N,RMSECV,'-o',LineWidth=1.5);
hold on;
plot(N,RMSEP,'-s',LineWidth=1.5);
xlabel("N");  % 更专业的表达
ylabel("Performance");  % 更准确的指标名称
legend(["RMSECV","RMSEP"]);  % 更清晰的图例说明
SCIPlot;
xlim([1.0,1.10]);
MySaveFig(fig,"Seletion_N_wheat1");
fig = figure("Name","Selection of N2","Color",'w');  % 修正了"Slection"拼写错误 
bar(N,num);
xlabel("N");  % 保持一致性
ylabel("Number of methods");  % 更简洁的表达
SCIPlot;
MySaveFig(fig,"Seletion_N_wheat2");