%scaling
function funcs = centeringFuncs()
funcs  = {@none,@centering_mean,@centering_median}; 
end

function [NewXtrain,NewXval] = centering_mean(Xtrain,Xval)
[NewXtrain,mx,msg] = mncn(Xtrain);
if nargin>1
    NewXval = Xval-mx;
end
end

function [NewXtrain,NewXval] = centering_median(Xtrain,Xval)
[NewXtrain,mx,msg] = medcn(Xtrain);
if nargin>1
    NewXval = Xval-mx;
end
end