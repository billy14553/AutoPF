function [XTrainData,YTrainData,XTestData,YTestData,indices] = easyCrossvalidation(X,y,fold)
% 调用matlab的crossvalind，将数据集做交叉检验划分
% X --每行为一个样本，y---列向量，fold----数据等分为几组
%XTrainData cell 类型 XTrainData{i}表示第i个分组的训练数据X,下面的类似
%YTrainData y训练数据
%XTestData  X测试数据
%YTestData  y测试数据
%indices指示了数据划分到那一组里面
[m,n] = size(X);

indices = crossvalind('Kfold', m, fold); 
for i= 1:1:fold
    test = (indices == i);
    train = ~test;
    XTrainData{i} = X(train, :);
    XTestData{i} = X(test, :);
    YTrainData{i} = y(train, :);
    YTestData{i} = y(test, :);
end
end