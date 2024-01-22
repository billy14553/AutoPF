function [NewXtrain,NewXval,vsel] = none(Xtrain,Xval,opt)
NewXtrain = Xtrain;
NewXval = [];
vsel = 1:size(Xtrain,2);
if nargin>1
   
if ~isempty(Xval)
    NewXval = Xval;
end

end
end