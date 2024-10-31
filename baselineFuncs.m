%BaseLine
%Asymmetric Least Squares Smoothing is time-comsuming, and not helpful for
%the datasets in AutoPF paper. Hence, it is not included in the default
%settings.


function funcs = baselineFuncs()
funcs  = {@none,@baseline_derivate1_1,...
    @baseline_derivate1_3,@baseline_derivate1_4,@baseline_derivate2_2,...
    @baseline_derivate2_3,@baseline_derivate2_4,@baseline_derivate2_5};%,...
    %@baseline_als_1_1,@baseline_als_1_2,@baseline_als_1_3};%,@baseline_wls

end
function funcs = baselineFuncs1()
funcs  = {@none,@baseline_derivate1_1,...
    @baseline_derivate1_3,@baseline_derivate1_4,@baseline_derivate2_2,...
    @baseline_derivate2_3,@baseline_derivate2_4,@baseline_derivate2_5,...
    @baseline_als_1_1,@baseline_als_1_2,@baseline_als_1_3};%,@baseline_wls

end
function [NewXtrain,NewXval] =  baseline_als_1_1(Xtrain,Xval)
[NewXtrain,ycorr]=asymcorr(Xtrain',100,0.01);
if nargin>1
    [NewXval,ycorr]=asymcorr(Xval',100,0.01);
end
end

function [NewXtrain,NewXval] =  baseline_als_1_2(Xtrain,Xval)
[NewXtrain,ycorr]=asymcorr(Xtrain',1000,0.01);
if nargin>1
    [NewXval,ycorr]=asymcorr(Xval',1000,0.01);
end
end

function [NewXtrain,NewXval] =  baseline_als_1_3(Xtrain,Xval)
[NewXtrain,ycorr]=asymcorr(Xtrain',10000,0.01);
if nargin>1
    [NewXval,ycorr]=asymcorr(Xval',10000,0.01);
end
end
function [NewXtrain,NewXval] = baseline_detrend(Xtrain,Xval)
option = [];
option.order = 1;
[NewXtrain]  = baseline(Xtrain,[],[],option);
if nargin>1
    NewXval =  baseline(Xval,[],[],option);
end
end
function [NewXtrain,NewXval] = baseline_derivate1_1(Xtrain,Xval)
ws = default_windows();
order = 1;
der = 1;
[NewXtrain]  = savgol(Xtrain,ws,order,der);
if nargin>1
    NewXval = savgol(Xval,ws,order,der);
end
end
function [NewXtrain,NewXval] = baseline_derivate1_3(Xtrain,Xval)
ws = default_windows();
order = 3;
der = 1;
[NewXtrain]  = savgol(Xtrain,ws,order,der);
if nargin>1
    NewXval = savgol(Xval,ws,order,der);
end
end
function [NewXtrain,NewXval] = baseline_derivate1_4(Xtrain,Xval)
ws = default_windows();
order = 4;
der = 1;
[NewXtrain]  = savgol(Xtrain,ws,order,der);
if nargin>1
    NewXval = savgol(Xval,ws,order,der);
end
end

function [NewXtrain,NewXval] = baseline_derivate2_1(Xtrain,Xval)
ws = default_windows();
order = 1;
der = 2;
[NewXtrain]  = savgol(Xtrain,ws,order,der);
if nargin>1
    NewXval = savgol(Xval,ws,order,der);
end
end

function [NewXtrain,NewXval] = baseline_derivate2_2(Xtrain,Xval)
ws = default_windows();
order = 2;
der = 2;
[NewXtrain]  = savgol(Xtrain,ws,order,der);
if nargin>1
    NewXval = savgol(Xval,ws,order,der);
end
end

function [NewXtrain,NewXval] = baseline_derivate2_3(Xtrain,Xval)
ws = default_windows();
order = 3;
der = 2;
[NewXtrain]  = savgol(Xtrain,ws,order,der);
if nargin>1
    NewXval = savgol(Xval,ws,order,der);
end
end
function [NewXtrain,NewXval] = baseline_derivate2_4(Xtrain,Xval)
ws = default_windows();
order = 4;
der = 2;
[NewXtrain]  = savgol(Xtrain,ws,order,der);
if nargin>1
    NewXval = savgol(Xval,ws,order,der);
end
end
function [NewXtrain,NewXval] = baseline_derivate2_5(Xtrain,Xval)
ws = default_windows();
order = 5;
der = 2;
[NewXtrain]  = savgol(Xtrain,ws,order,der);
if nargin>1
    NewXval = savgol(Xval,ws,order,der);
end
end
function [NewXtrain,NewXval] = baseline_wls(Xtrain,Xval)
option = [];

option.filter = 'basis';
[m,n] = size(Xtrain);
[NewXtrain,wts,baseline,vweights] = wlsbaseline(Xtrain,3,option);
if nargin>1
    X =[ Xtrain;Xval];
    [X,wts,baseline,vweights] = wlsbaseline(X,3,option);
    NewXtrain = X(1:m,:);
    X(1:m,:) = [];
    NewXval = X;
end
end
