function RMSECV = FitnessFunction(x)
global Configuration;
Xtrain = Configuration.XtrainData;
ytrain = Configuration.ytrainData;
RMSECV = crossvalidate(Xtrain,ytrain,x,1:size(Xtrain,2),1);
Configuration.minVal = min([Configuration.minVal,RMSECV]);
Configuration.RMSECV(Configuration.Iter) = Configuration.minVal;
Configuration.Iter = Configuration.Iter + 1;
rng(1);
end