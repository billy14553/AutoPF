function [metric_p,yhat] = comboPredict(model,Xt,yt)
    combo = model.obj;
    %combo = model;
    x = combo.x1;
    Xtrain= combo.X;
    ytrain = combo.y;
    LV = model.LVs;
    for i = 1:1:length(x)
        idx = x(i);
        [Xtrain,Xt] = model.Backbone{i}{idx}(Xtrain,Xt);
    end
    Xtrain = Xtrain(:,combo.vsel);
    Xt = Xt(:,combo.vsel);
    [~,yhat,metric_p] = model.modeling_evalation(Xtrain,ytrain,LV,Xt,yt);
end