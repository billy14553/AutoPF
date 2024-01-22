% Scatter Correction  

function funcs = scatterFuncs()
 funcs  = {@none,@scatter_snv1,@scatter_msc1,@scatter_emsc};%
 %funcs  = {@none,@scatter_snv1,@scatter_msc1,@scatter_vsn,@scatter_emsc};
end
function [NewXtrain,NewXval] = scatter_snv1(Xtrain,Xval)
[NewXtrain]  = snv(Xtrain);
if nargin>1
    NewXval = snv(Xval);
end
end
function [NewXtrain,NewXval] = scatter_msc1(Xtrain,Xval)
mx = mean(Xtrain);
[NewXtrain]  = mscorr(Xtrain,mx);
if nargin>1
    NewXval = mscorr(Xval,mx);
end
end
%vsn is time-consuming
function [NewXtrain,NewXval] = scatter_vsn(Xtrain,Xval)
[NewXtrain]  = vsn(Xtrain);
if nargin>1
    NewXval = vsn(Xval);
end
end
function [NewXtrain,NewXval] = scatter_emsc(Xtrain,Xval)
 [m,n] = size(Xtrain);
 [NewXtrain]  = WeightedEmsc(Xtrain,ones(1,n)/n,1);
if nargin>1
    X =[ Xtrain;Xval];
    X = WeightedEmsc(X,ones(1,n)/n,1);
    NewXtrain = X(1:m,:);
    X(1:m,:) = [];
    NewXval = X;
end
end
