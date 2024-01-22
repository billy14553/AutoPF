%variable selection for regression
function funcs = variableselRegFuncs()
funcs  = {@none,@variablesel_reg_cars,@variablesel_reg_uve,@variablesel_reg_RF};
end

function [NewXtrain,NewXval,vsel] = variablesel_reg_cars(Xtrain,Xval,opt)
fold = 5;
CARS = carspls(Xtrain,opt.ytrainData,opt.LVs,fold);
NewXtrain = Xtrain(:,CARS.vsel);
if ~isempty(Xval)
    NewXval = Xval(:,CARS.vsel);
end
vsel = CARS.vsel;
end

function [NewXtrain,NewXval,vsel] = variablesel_reg_mwpls(Xtrain,Xval,opt)

width = default_windows();
[WP,RMSEF]=mwpls(Xtrain,opt.ytrainData,opt.LVs,width);
rf = RMSEF(:,opt.LVs);
k = median(rf);
array = find(rf<=k);
array = array + floor(width/2);
NewXtrain = Xtrain(:,array);
if ~isempty(Xval)
    NewXval = Xval(:,array);
end
vsel = array;
end
 
function [NewXtrain,NewXval,vsel] = variablesel_reg_uve(Xtrain,Xval,opt)
m = size(Xtrain,2);
N=500;
method='center';
UVE=mcuvepls(Xtrain,opt.ytrainData,opt.LVs,method,N);
rf = UVE.RI;
k = median(rf);
array = find(rf>=k);
NewXtrain = Xtrain(:,array);
if ~isempty(Xval)
    NewXval = Xval(:,array);
end
vsel = array;
end

function [NewXtrain,NewXval,vsel] = variablesel_reg_RF(Xtrain,Xval,opt)
m = size(Xtrain,2);
N=1000;
method='center';
FROG=randomfrog_pls(Xtrain,opt.ytrainData,opt.LVs,method,N);
rf = FROG.probability;
k = median(rf);
array = find(rf>=k);
NewXtrain = Xtrain(:,array);
if ~isempty(Xval)
    NewXval = Xval(:,array);
end
vsel = array;
end
