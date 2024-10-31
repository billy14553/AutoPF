% Gives baseline corrected data sets
% function [ycorr,ztot]=asymcorr(t,y,lambda,p)

function [ycorr,ztot]=asymcorr(y,lambda,p)
close all
[m,n]=size(y);
% Set paremters p
% p = 0.001;  % asymmetry
% lambda = 1e7;  % smoothness (larger lambda gives smoother curve)
% Fit baseline
ycorr=[];
ztot=[];
for i=1:n
    D = diff(speye(m), 2);
    w = ones(m, 1);
    for it = 1:20
        W = spdiags(w, 0, m, m);
        C = chol(W + lambda * D' * D);
        z = C \ (C' \ (w .* y(:,i)));
        w_old = w;
        w = p * (y(:,i) > z) + (1 - p) * (y(:,i) < z);
        sw = sum(w_old ~= w);
        %     disp(sw)
        if sw == 0, break, end
    end
    yindcorr=y(:,i)-z;
    ycorr=[ycorr;yindcorr'];
    ztot=[ztot;z'];
end






