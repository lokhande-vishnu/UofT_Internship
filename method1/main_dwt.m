function [vector] = vishnu_dwt(input)

  
    %DWT
    input=input';
    [C,L] = wavedec(input,6,'db4');          % All wavelet coefficients here and respe.length
    cA6 = appcoef(C,L,'db4',6);
    [cD1,cD2,cD3,cD4,cD5,cD6] = detcoef(C,L,[1,2,3,4,5,6]);
    
    % Autocorrelation(AC)
    [ACF4, Lags4] = xcorr(cD4, length(cD4)-1);
    [ACF5, Lags5] = xcorr(cD5, length(cD5)-1);
    [ACF6, Lags6] = xcorr(cD6, length(cD6)-1);
    
    var_AC4=sum((ACF4-mean(ACF4)).^2)/(length(ACF4)-1);
    var_AC5=sum((ACF5-mean(ACF5)).^2)/(length(ACF5)-1);
    var_AC6=sum((ACF6-mean(ACF6)).^2)/(length(ACF6)-1);
    
    % Moving Average Filter
    l1=length(cD1);
    l2=length(cD2);
    l3=length(cD3);
    m=5;                                    % 'm' must be odd for symmetrical arrangments
    sum1=0;
    
    % Moving average for cD1
    for k = 1:l1
        if k<=m || k>(l1-m)
            arr(k)=0;                    % leaving initial and last samples
        else
            sum1=0;
            for l=(k-m):(k+m-1)
                sum1=sum1+abs(cD1(l));
            end
            sum1=sum1/(2*m);
            S1(k-m)=sum1;
        end
    end
    clear arr l1 k sum1;
    
    % Moving average for cD2
    for k = 1:l2
        if k<=m || k>(l2-m)
            arr(k)=0;
        else
            sum1=0;
            for l = (k-m):(k+m-1)
                sum1=sum1+abs(cD2(l));
            end
            sum1=sum1/(2*m);
            S2(k)=sum1;
        end
    end
    
    clear arr l2 k sum1;
    sum1=0;
    
    % Moving average for cD3
    for k = 1:l3
        if k<=m || k>(l3-m)
            arr(k)=0;
        else
            for l=(k-m):(k+m-1)
                sum1=sum1+abs(cD3(l));
            end
            sum1=sum1/(2*m);
            S3(k-m)=sum1;
            sum1=0;
        end
    end
    clear k l3 arr sum1;
    
    % Following variance provide power of high-frequency vibrations
    
    var_1=sum((cD1-mean(cD1)).^2)/(length(cD1)-1);
    var_2=sum((cD2-mean(cD2)).^2)/(length(cD2)-1);
    var_3=sum((cD3-mean(cD3)).^2)/(length(cD3)-1);
    
    % Sample Mean & Quotient provides maximum local extent of high frequencyvibrations
    M_S1=mean(S1);
    M_S2=mean(S2);
    M_S3=mean(S3);
    vector=[var_1 var_2 var_3 var_AC4 var_AC5 var_AC6 M_S1 M_S2 M_S3];
   % X(i,1)=var_1;X(i,2)=var_2;X(i,3)=var_3;X(i,4)=var_AC4;X(i,5)=var_AC5;X(i,6)=var_AC6;X(i,7)=M_S1;X(i,8)=M_S2;X(i,9)=M_S3;
    
    clear cA6 cD1 cD2 cD3 cD4 cD5 cD6;
    clear ACF4 ACF5 ACF6 Lags4 Lags5 Lags6;
    clear var_1 var_2 var_3 var_AC4 var_AC5 var_AC6 M_S1 M_S2 M_S3;
    clear C L m S1 S2 S3;


end