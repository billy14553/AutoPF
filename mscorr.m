function [sx,alpha,beta] = mscorr(x,xref)
[m,n]       = size(xref);
if n>m
  xref      = xref';  
  m         = n;
end
[sx,alpha]  = mncn(x');
[xref,mx]   = mncn(xref);
beta        = (xref\sx)';
alpha       = (alpha-mx*beta')';
sx          = (x-alpha(:,ones(m,1)))./beta(:,ones(1,m));

