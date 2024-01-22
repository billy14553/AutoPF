%variable selection discrimination 
function funcs = variableselDaFuncs()
funcs  = {@none,@variablesel_da_cars,@variablesel_da_RF,@variablesel_da_spa};
end
function [NewXtrain,NewXval,vsel] = variablesel_da_cars(Xtrain,Xval,opt)
fold = 5;
CARS = carsplslda(Xtrain,opt.ytrainData,opt.LVs,fold);
NewXtrain = Xtrain(:,CARS.vsel);
if ~isempty(Xval)
    NewXval = Xval(:,CARS.vsel);
end
vsel = CARS.vsel;
end

function [NewXtrain,NewXval,vsel] = variablesel_da_RF(Xtrain,Xval,opt)
m = size(Xtrain,2);
N=2000;
method='center';
FROG=randomfrog_plslda(Xtrain,opt.ytrainData,opt.LVs,method,N);
rf = FROG.probability;
k = median(rf);
array = find(rf>=k);
NewXtrain = Xtrain(:,array);
if ~isempty(Xval)
    NewXval = Xval(:,array);
end
vsel = array;
end

function [NewXtrain,NewXval,vsel] = variablesel_da_spa(Xtrain,Xval,opt)
m = size(Xtrain,2);
N=1000;
method='center';
K=3;                                
Q=floor(m/4);                              
ratio = 0.6;
SPA=spa(Xtrain,opt.ytrainData,opt.LVs,K,Q,N,ratio,method);
rf = SPA.COSS;
k = median(rf);
array = find(rf>=k);
NewXtrain = Xtrain(:,array);
if ~isempty(Xval)
    NewXval = Xval(:,array);
end
vsel = array;
end
