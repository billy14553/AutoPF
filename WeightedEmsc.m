function [z] = WeightedEmsc( x, w, k )
% CorrSp = WeightedEmsc( Sp, Weights, Degree )
%EMSC normalisation where parameters  values  are computed using a wavelength weighting.

% Inputs :
%	 - Sp :  spectra to be normalized (one per line)
%	 - Weights :  wavelength weighting (line vector)
%    - Degree : polynom degree of the baseline


    % ref spectrum
    r = mean(x,1)';
    
    p = size(x, 2);
    n = size(x, 1);

    % make a proba
    w = w ./ sum(w);
    % create weighting matrix
    W = diag(w);
    
    % regressors matrix
    v = mean(x)';
    for i=k:-1:0
        v = [v , (1:p)'.^i];
    end;
    
    m = inv(v'*W*v)*v'*W;
    
    for i=1:n
        abcd = m * x(i,:)';
        z(i,:) = (x(i,:) - abcd(2:end)' * v(:,2:end)' )./abcd(1);
    end;
end