function [metric_p] = comboPredict(combo,Xt,yt)
    global Configuration;
    x = combo.x1;
    Xtrain= combo.X;
    ytrain = combo.y;
    LV = Configuration.LVs;
    for i = 1:1:length(x)
        idx = x(i);
        [Xtrain,Xt] = Configuration.Backbone{i}{idx}(Xtrain,Xt);
    end
    Xtrain = Xtrain(:,combo.vsel);
    Xt = Xt(:,combo.vsel);
    [~,~,metric_p] = Configuration.modeling_evalation(Xtrain,ytrain,LV,Xt,yt);
end