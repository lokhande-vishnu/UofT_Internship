function [ feas ] = featureEx( data )
x = -5:0.1:2.1;
% ers_curve=(tanh(x)+3)/4;
ers_curve=(tanh(x)+3)/100;
sample=-(tanh(x/0.25)/3)+0.5;
erd_curve=sample(43:63);

% Function prototypes% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SSN_=@Spec_Smooth_Normailze; % returns smoothed normalized (to trial number) spectral data
CTmain_=@corr_tabulation;        % cross correlates ERD signal and frequency band
CTfast_=@corr_faster;       % A faster version of corr_tabulation


[ssns,ssn,twent,T] = SSN_(data);
%[vector,store]=CTmain_(erd_curve,ssn);
[vector,store]=CTfast_(erd_curve,ssn);
feas= vector;

end

