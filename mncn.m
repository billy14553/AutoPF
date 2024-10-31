function [mcx,mx] = mncn(x)

[m,n] = size(x);
mx    = mean(x);
mcx   = (x-mx(ones(m,1),:));
