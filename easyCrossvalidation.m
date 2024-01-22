function [XTrainData,YTrainData,XTestData,YTestData,indices] = easyCrossvalidation(X,y,fold)
% ����matlab��crossvalind�������ݼ���������黮��
% X --ÿ��Ϊһ��������y---��������fold----���ݵȷ�Ϊ����
%XTrainData cell ���� XTrainData{i}��ʾ��i�������ѵ������X,���������
%YTrainData yѵ������
%XTestData  X��������
%YTestData  y��������
%indicesָʾ�����ݻ��ֵ���һ������
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