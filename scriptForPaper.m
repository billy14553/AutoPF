%Preprocessing method from PLS TOOLBOX
%2023/9/13 to avoid overfitting, we use RMSECV instead of RMSEC
clear;
close all;

%data format
%X,y---train
%Xtest,ytest---test
%AllDataNames = ["wheat","meat","tablets"];
%wheat
%0.436	0.393
%meat
%0.627	0.741
%table
%RMSEC	0.282	0.284	0.296
%RMSEP	0.321	0.322	0.318
%Using gloal variable to share information with GA process

global Configuration;
%AllDataNames = ["meat"];
AllDataNames = ["wheat","meat","barley"];
taskList = ["regression","regression","classfication"];
optimaLvs = [7,7,9];
appname = [];
for i = 3:1:3
    t1 = cputime;
    Configuration = [];
    LV  =optimaLvs(i);
    fold = 4;
    task = taskList(i);
    appname = AllDataNames(i);
    disp(AllDataNames(i));
    load(AllDataNames(i));
    buildConfigration(task,fold,LV);
    obj = preprocessCombos(X,y);
    metric_c = obj.metric_cv2;
    result = Configuration;
    result.metric_c = metric_c;
    result.obj = obj;
    metric_p = comboPredict(result,Xtest,ytest);
    if strcmp(Configuration.task,"classfication")==1
        metric_c = 1-metric_c;
        metric_p = 1-metric_p;
    end
    fprintf("best combinations: ");
    for j = 1:1:length(obj.x1)
        idx = obj.x1(j);
        fprintf("%d:%s, ",j,func2str( Configuration.Backbone{j}{idx}));
    end
    fprintf("\n best variable selection:%s \n",func2str( Configuration.extraWork{1}{obj.x2}));
    fprintf("current task: %s, metric_cv: %.3f,metric_p: %.3f \n",...
        Configuration.task,metric_c,metric_p);
    %RMSECVArray(k) =  metric_c;
    %RMSEPArray(k) = metric_p;
    t2 = cputime;

   % save(AllDataNames(i)+"Res"+"LV"+num2str(LV));
    disp(fprintf("CPU Time: %.2f \n",t2-t1));
    %
    if strcmp(Configuration.task,"regression")==1
        optimalRMSECV1 = [];
        %draw RMSECV from 1-10 for each preprocessing method
        singlePreprocess
    end
    generateImportance;

end