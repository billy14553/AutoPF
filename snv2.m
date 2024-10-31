function [spectra_snv,mean_spectra,std_spectra] = snv2(spectra)
%SNV Standard normal variate scaling.
    mean_spectra = mean(spectra, 2);
    std_spectra = std(spectra, 0, 2);
    spectra_snv = (spectra - mean_spectra) ./ std_spectra;
end

 