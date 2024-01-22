%others
function funcs = othersFuncs()
funcs  = {@none,@others_osc,@others_alignspectra1,@others_windowsfilter1,@others_glsw};
end

function [NewXtrain,NewXval] = others_osc(Xtrain,Xval,opt)
if nargin <3
    NewXtrain = Xtrain;
    NewXval =Xval;
    return;
end
[NewXtrain,nw,np,nt] = osccalc(Xtrain,opt.ytrain,5);
if nargin>1
    NewXval = oscapp(Xval,nw,np,nt);
end
end

function [NewXtrain,NewXval] = others_alignspectra1(Xtrain,Xval)
mx = mean(Xtrain);
[m,n] = size(Xtrain);
NewXtrain = Xtrain;
ax  = 1:n;
y0 = mx;
for i = 1:1:m
    y1 = Xtrain(i,:);
    [s,y10a]  = alignspectra(ax,y0,y1,25,7);
    NewXtrain(i,:)  = alignspectra(s,y1);
end
if nargin>1
    NewXval = Xval;
    for i = 1:1:m
        y1 = Xval(i,:);
        [s,y10a]  = alignspectra(ax,y0,y1,25,7);
        NewXval(i,:)  = alignspectra(s,y1);
    end
end
end

function [NewXtrain,NewXval] = others_windowsfilter1(Xtrain,Xval)
[NewXtrain]  = windowfilter(Xtrain,default_windows());
if nargin>1
    NewXval = windowfilter(Xval,default_windows());
end
end
function [NewXtrain,NewXval] = others_glsw(Xtrain,Xval)
a = 100;
modl = glsw(Xtrain,a);
[NewXtrain]  =glsw(Xtrain,modl);
if nargin>1
    NewXval = glsw(Xval,modl);
end
end