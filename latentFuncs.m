%SMOTHING

function funcs = latentFuncs()
 funcs  = {@none,@smothing_sgolay,@smothing_mw_average};%,,@smothing_cwt
end

function [NewXtrain,NewXval] = latent1(Xtrain,Xval)
NewXtrain = Xtrain;
for i = 1:1:size(Xtrain,1)
    x0 = Xtrain(i,:);
    fs = cwt(x0);
    NewXtrain(i,:) = icwt(fs);
end

if nargin>1
    NewXval = Xval;
    for i = 1:1:size(Xval,1)
        x0 = Xval(i,:);
        fs = cwt(x0);
        NewXval(i,:) = icwt(fs);
    end
end
end

function [NewXtrain,NewXval] = smothing_mw_average(Xtrain,Xval)
NewXtrain = smoothdata(Xtrain,2,'movmean',default_windows());
if nargin>1
    NewXval = smoothdata(Xval,2,'movmean',default_windows());
end
end

function [NewXtrain,NewXval] = smothing_sgolay(Xtrain,Xval)
NewXtrain = smoothdata(Xtrain,2,'sgolay',default_windows());
if nargin>1
    NewXval = smoothdata(Xval,2,'sgolay',default_windows());
end
end
