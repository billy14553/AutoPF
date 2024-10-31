function sx = scale(x,means,stds)
[m,n] = size(x);
sx = (x-means(ones(m,1),:))./stds(ones(m,1),:);
