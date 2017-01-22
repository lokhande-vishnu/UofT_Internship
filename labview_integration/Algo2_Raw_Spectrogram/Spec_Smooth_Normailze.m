function [N_10,N_15,N_20,T] = Spec_Smooth_Normailze(data)


[S,F,T,P] = spectrogram(data,256,120,1:1:50,1E3);

data2=S.*conj(S);
% data2=data2(:,1:30);

% for i=1:size(data2,1)
%
%   data3=data2(i,:);
%   h(i)=plot(data3);     ;
%   filename=sprintf('plain%d.jpg',i);
%   fname = 'C:\Users\lokhanV\Desktop\kathryns work\data2plots';
%   saveas(h(i), fullfile(fname, filename), 'jpeg');
% end

for i=1:size(data2,1)
    
    S_10(i,:)=smooth(data2(i,:),10,'lowess');
    S_15(i,:)=smooth(data2(i,:),15,'lowess');
    S_20(i,:)=smooth(data2(i,:),20,'lowess');
    
    %   g(i)=plot(S_10(i,:));
    %   filename=sprintf('smoothened%d.jpg',i);
    %   fname = 'C:\Users\lokhanV\Desktop\kathryns work\smoothplots';
    %   saveas(g(i), fullfile(fname, filename), 'jpeg');
    
end

for i=1:size(data2,1)
%     N_10(i,:)=S_10(i,:)./max(S_10(i,:));
%     N_15(i,:)=S_15(i,:)./max(S_15(i,:));
%     N_20(i,:)=S_20(i,:)./max(S_20(i,:));
%  
    N_10(i,:)=S_10(i,:);
    N_15(i,:)=S_15(i,:);
    N_20(i,:)=S_20(i,:);
     
    %   j(i)=plot(N_10(i,:));
    %   filename=sprintf('normaliseplots%d.jpg',i);
    %   fname = 'C:\Users\lokhanV\Desktop\kathryns work\normaliseplots';
    %   saveas(j(i), fullfile(fname, filename), 'jpeg');
end
end


