function [y_hat,D]= savgol(y,width,order,deriv)
[m,n] = size(y);
y_hat = y;
w = max( 3, 1+2*round((width-1)/2) );
o = min([max(0,round(order)),5,w-1]);
d = min(max(0,round(deriv)),o);
p = (w-1)/2;
x = ((-p:p)'*ones(1,1+o)).^(ones(size(1:w))'*(0:o));
weights = x\eye(w);
coeff=prod(ones(d,1)*[1:o+1-d]+[0:d-1]'*ones(1,o+1-d,1),1);
D=spdiags(ones(n,1)*weights(d+1,:)*coeff(1),p:-1:-p,n,n);
w1=diag(coeff)*weights(d+1:o+1,:);
D(1:w,1:p+1)=[x(1:p+1,1:1+o-d)*w1]'; 
D(n-w+1:n,n-p:n)=[x(p+1:w,1:1+o-d)*w1]';
y_hat=y*D;
