%crossvalidate Xtrain and y ,using preprocessing method x
%x(i) indicate  Backbone{i}{idx}
%note we set rng(0) to make sure the result is reproducible.
%Add Sparse 
function RMSECV = crossvalidate(Xtrain,y,x,vsel,penality)
global Configuration;

 
rng(0);
[XTrainData,YTrainData,XTestData,YTestData,indices] = easyCrossvalidation(Xtrain,y,Configuration.fold);
RMSECV = 0;
for j = 1:1:Configuration.fold
    Xtrain = XTrainData{j};
    ytrain =  YTrainData{j};
    Xt = XTestData{j};
    ytest = YTestData{j};
for i = 1:1:length(x)
    idx = x(i);
    tmp = Xtrain;
    [Xtrain,Xt] = Configuration.Backbone{i}{idx}(Xtrain,Xt);
end

if nargin>3
    Xtrain = Xtrain(:,vsel);
    Xt = Xt(:,vsel);
end
[~,~,RMSEV] = Configuration.modeling_evalation(Xtrain,ytrain,Configuration.LVs,Xt,ytest);  
RMSECV = RMSECV+RMSEV;
end
RMSECV = RMSECV / Configuration.fold;
if penality==1
    RMSECV = penalizedRMSECV(RMSECV,x,vsel);
end
%if len ~= 0
   % n = length(find(x==1));
   % coef = (1.05)^(len-n);
    %disp(x);
    %disp(sprintf('RMSECV%.3f,RMSECV*coef:%.3f',RMSECV,RMSECV*coef));
   % RMSECV = RMSECV*coef;
   %RMSECV= penalizedRMSECV(RMSECV,x,vsel)
%end

end