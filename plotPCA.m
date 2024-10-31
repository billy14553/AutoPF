clear;
close all;
load('barleyResLV11');


 
[coef,scores,latent,tsquared,explained,mu] = pca(X);
for i = 1:1:24
    map(i,:) = [0,0,0];
end

order = get(gca,'colororder');
figure;
for i = 1:1:7
    hold on;
    plot(rand(100,1),'Color',order(i,:),'LineWidth',3);
    legend;
end


figure;
idx = [4,8,24,21];
type = ['d','^','v','s'];
markersize = 66;
array = [];
total = 1:length(y);
 for i = 1:1:4
     map(idx(i),:) = order(i,:);
     array = [array;find(y==idx(i))];
 end 
  rest = setdiff(total,array);
hold on;
 for i = 1:1:4
      
     array =  find(y==idx(i)) ;
     s = scatter(nan,nan,markersize,map(idx(i),:),'filled',type(i));

 end 
s = scatter(nan,nan,markersize,[0,0,0],'filled');
scores(:,1) = scores(:,1)/std(scores(:,1));
scores(:,2) = scores(:,2)/std(scores(:,2));

 s = scatter(scores(rest,1),scores(rest,2),markersize,map(y(rest),:),'filled');
hold on;
 for i = 1:1:4
      
     array =  find(y==idx(i)) ;
     s = scatter(scores(array,1),scores(array,2),markersize,map(y(array),:),'filled',type(i));

 end 

 [~,objh] = legend(["Bekoji-1","EH 1493","Traveller","Misccal-21","rest"], ...
     'orientation','horizontal','FontSize', 12);
 xlabel(sprintf("PC 1 (%.2f %% Explained)",explained(1)));
 ylabel(sprintf("PC 2 (%.2f %% Explained)",explained(2)));
 SCIPlot;

 
figure;

    Xtrain = obj.X;
    for i = 1:1:length(obj.x1)
        idx1 = obj.x1(i);
        [Xtrain,Xtrain] = result.Backbone{i}{idx1}(Xtrain,Xtrain);
    end

[coef,scores,latent,tsquared,explained,mu] = pca(Xtrain);
 
hold on;
 for i = 1:1:4
      
     array =  find(y==idx(i)) ;
     s = scatter(nan,nan,markersize,map(idx(i),:),'filled',type(i));

 end 
s = scatter(nan,nan,markersize,[0,0,0],'filled');
scores(:,1) = scores(:,1)/std(scores(:,1));
scores(:,2) = scores(:,2)/std(scores(:,2));
 s = scatter(scores(rest,1),scores(rest,2),markersize,map(y(rest),:),'filled');
hold on;
 for i = 1:1:4
      
     array =  find(y==idx(i)) ;
     s = scatter(scores(array,1),scores(array,2),markersize,map(y(array),:),'filled',type(i));

 end 

 [~,objh] = legend(["Bekoji-1","EH 1493","Traveller","Misccal-21","rest"], ...
     'orientation','horizontal','FontSize', 12);
 xlabel(sprintf("PC 1 (%.2f %% Explained)",explained(1)));
 ylabel(sprintf("PC 2 (%.2f %% Explained)",explained(2)));
 SCIPlot;

