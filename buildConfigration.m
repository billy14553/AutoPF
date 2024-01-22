%buildConfigration
%task---¡°regression¡±,"classification"
%fold--- cross validation
%Configuration.Backbone: optimized with GA process
% Configuration.extraWork: some time-comsuming process. 
function   buildConfigration(task,fold,LV)
global Configuration;
Configuration.fold = fold;
Configuration.task = task;
Configuration.LVs = LV;
Configuration.Backbone = {smothingFuncs(),baselineFuncs(),scatterFuncs(),centeringFuncs(),scalingFuncs()};
if strcmp(task,"regression")==1
    Configuration.extraWork = {variableselRegFuncs()};
    Configuration.modeling_evalation = @pls_modeling_evalation;
else
    Configuration.extraWork = {variableselDaFuncs()};
    Configuration.modeling_evalation = @SVM_modeling_evalation;
end