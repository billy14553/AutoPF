function [RMSEC,yhat,RMSEP] = pls_modeling_evalation(Xtrain,y,LV,Xt,ytest)
LV = min(size(Xtrain,2),LV);
[XL,YL,XS,YS,BETA,PCTVAR,MSE,STATS] = plsregress(Xtrain,y,LV);
RMSEC = sqrt(MSE(2,LV));
RmseCurve = MSE(2,:);
if nargin>3
    yhat = [ones(size(Xt,1),1),Xt]*BETA;
    RMSEP =  sqrt(mean((yhat-ytest).^2));
end
end