function result = autopf(X,y,task,LV,fold)

%Using gloal variable to share information with GA process
global Configuration;
buildConfigration(task,fold,LV);
obj = preprocessCombos(X,y);
metric_c = obj.metric_cv2;
%metric_p = comboPredict(obj,Xtest,ytest);
if strcmp(Configuration.task,"classfication")==1
    metric_c = 1-metric_c;
%   metric_p = 1-metric_p;
end
fprintf("best combinations: ");
for i = 1:1:length(obj.x1)
    idx = obj.x1(i);
    fprintf("%d:%s, ",i,func2str( Configuration.Backbone{i}{idx}));
end
fprintf("\n best variable selection:%s \n",func2str( Configuration.extraWork{1}{obj.x2}));
fprintf("current task: %s, metric_cv: %.2f\n",...
    Configuration.task,metric_c);
result = Configuration;
result.metric_c = metric_c;
result.obj = obj;
end