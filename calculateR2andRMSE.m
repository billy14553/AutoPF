function [R2, RMSE] = calculateR2andRMSE(y_true, y_pred)
    % 输入参数：
    % y_true - 真实值向量
    % y_pred - 预测值向量
    %
    % 输出参数：
    % R2 - 决定系数
    % RMSE - 均方根误差

    % 检查输入向量的长度是否一致
    if length(y_true) ~= length(y_pred)
        error('真实值和预测值的长度必须一致');
    end

    % 计算观测值的平均值
    y_bar = mean(y_true);

    % 计算总平方和 SS_tot
    SS_tot = sum((y_true - y_bar).^2);

    % 计算残差平方和 SS_res
    SS_res = sum((y_true - y_pred).^2);

    % 计算决定系数 R^2
    R2 = 1 - (SS_res / SS_tot);

    % 计算均方根误差 RMSE
    RMSE = sqrt(mean((y_true - y_pred).^2));

    % 输出结果
   % fprintf('决定系数 R^2: %.4f\n', R2);
   % fprintf('均方根误差 RMSE: %.4f\n', RMSE);
end