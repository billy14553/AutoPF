%scaling
function funcs = scalingFuncs()
funcs  = {@none,@scaling_auto};%@scaling_poisson,,@scaling_pareto,@scaling_sqrtmean,,
end

function [NewXtrain,NewXval] = scaling_auto(Xtrain,Xval)
[NewXtrain,mx,stdx]  = auto(Xtrain);
if nargin>1
    NewXval = scale(Xval,mx,stdx);
end
if mean(stdx)<0.1
    NewXtrain = Xtrain;
    if nargin>1
       NewXval = Xval;
    end
end
end

function [NewXtrain,NewXval] = scaling_pareto(Xtrain,Xval)
 
 [junk,junk,stdev] = auto(Xtrain);
  NewXtrain = scale(Xtrain,stdev*0,sqrt(stdev));
   
if nargin>1
 NewXval = scale(Xval,stdev*0,sqrt(stdev));
end
end

function [NewXtrain,NewXval] = scaling_sqrtmean(Xtrain,Xval)
 
    [junk,mx] = mncn(Xtrain);
    sx = sqrt(mx);
   NewXtrain = scale(Xtrain,sx*0,sx);
   
if nargin>1
 NewXval = scale(Xval,sx*0,sx);
end
end

function [NewXtrain,NewXval] = scaling_poisson(Xtrain,Xval)
 [NewXtrain,sc] = poissonscale(Xtrain);     %calibrate scaling
if nargin>1
  NewXval = poissonscale(Xval,sc);    
end
end
