%    combo.x1                 best combinations of preprocessing 
%    combo.metric_cv1   cv result afer preprocessing
%    combo.x2                 best variable selection method
%    combo.metric_cv2   cv result afer variable selection
%    combo.X                   X matrix
%    combo.y                   y  response
%    combo.vsel              best subset of variables
  
function combo = preprocessCombos(X,y)
    global Configuration;
    Xtrain = X;
    [x1,metric_cv] = gaPreprecessing(X,y,Configuration.LVs);
    for i = 1:1:length(x1)
        idx = x1(i);
        [Xtrain] = Configuration.Backbone{i}{idx}(Xtrain);
    end
    list = Configuration.extraWork{1};
    RMSECV= zeros(length(list),1);
    vsel = cell(length(list),1);
    for i = 1:1:length(list)
         [Xtrain1,~,vsel{i}] = list{i}(Xtrain,Xtrain,Configuration);
         %Xtrain1 = Xtrain(:,vsel{i});
         RMSECV(i) = crossvalidate(X,y,x1,vsel{i});
    end
    [combo.metric_cv2,x2] = min(RMSECV);
    combo.x1 = x1;
    combo.x2 = x2;
    combo.X  = X;
    combo.y   = y;
    combo.vsel = vsel{x2};
    combo.metric_cv1 = metric_cv;
 
end