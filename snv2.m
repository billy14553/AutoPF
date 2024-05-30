function [spectra_snv,mean_spectra,std_spectra] = snv2(spectra)
%SNV Standard normal variate scaling.
    % 计算每个样本的均值和标准差
    mean_spectra = mean(spectra, 2);
    std_spectra = std(spectra, 0, 2);
    
    % 对每个样本进行 SNV 转换
    spectra_snv = (spectra - mean_spectra) ./ std_spectra;
end

 