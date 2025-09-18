%for wheat
%SG-15-2-3 + MSC
RMSECV = [0.469,0.469,0.469,0.472,0.472,0.469,0.469,0.469,0.469,0.469,0.469];
RMSEP = [0.403,0.403,0.403,0.400,0.400,0.403,0.403,0.403,0.403,0.403,0.403];
num = [4,3,2,2,2,2,2,2,2,2,2];
N = 0:1:10;


figure("Name","Random seed for GA Process on wheat data","Color",'w');  

plot(N,RMSECV,'-o',LineWidth=1.5);
hold on;
plot(N,RMSEP,'-s',LineWidth=1.5);
xlabel("Random seed for GA process");  % 更专业的表达
ylabel("Performance");  % 更准确的指标名称
legend(["RMSECV","RMSEP"],'Location','best');  % 更清晰的图例说明
SCIPlot;

RMSECV = [0.687,0.687,0.687,0.687,0.675,0.687,0.687,0.675,0.687,0.687,0.687];
RMSEP = [0.695,0.695,0.695,0.695,0.707,0.695,0.695,0.707,0.695,0.695,0.695];


%SG-15-2-4+SNV+CARS
figure("Name","Random seed for GA process on meat data","Color",'w');

plot(N,RMSECV,'-o',LineWidth=1.5);
hold on;
plot(N,RMSEP,'-s',LineWidth=1.5);
xlabel("Random seed for GA process");  % 更专业的表达
ylabel("Performance");  % 更准确的指标名称
legend(["RMSECV","RMSEP"],'Location','best');  % 更清晰的图例说明
SCIPlot;