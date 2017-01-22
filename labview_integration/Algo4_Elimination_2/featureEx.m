function [ feas ] = featureEx( data1, data2, data3, data4 )
x = -5:0.1:2.1;
% ers_curve=(tanh(x)+3)/4;
ers_curve=(tanh(x)+3)/100;
sample=-(tanh(x/0.25)/3)+0.5;
erd_curve=sample(43:63);

% Function prototypes% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SSN_=@Spec_Smooth_Normailze; % returns smoothed normalized (to trial number) spectral data
CTmain_=@corr_tabulation;        % cross correlates ERD signal and frequency band

feas=[];

[ssns,ssn,twent,T] = SSN_(data1);
[vector,store]=CTmain_(erd_curve,ssn);
feas= [feas;vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];

[ssns,ssn,twent,T] = SSN_(data2);
[vector,store]=CTmain_(erd_curve,ssn);
feas= [feas;vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];

[ssns,ssn,twent,T] = SSN_(data3);
[vector,store]=CTmain_(erd_curve,ssn);
feas= [feas;vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];

[ssns,ssn,twent,T] = SSN_(data4);
[vector,store]=CTmain_(erd_curve,ssn);
feas= [feas;vector{1};vector{2};vector{3};vector{4};vector{5};vector{6};vector{7}];

end

