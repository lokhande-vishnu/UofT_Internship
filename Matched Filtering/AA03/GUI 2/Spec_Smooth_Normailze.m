function [N_10,T] = Spec_Smooth_Normailze(data)

[S,F,T,P] = spectrogram(data,256,120,1:1:30,1E3);
data2=S.*conj(S);
for i=1:size(data2,1)

   S_10(i,:)=smooth(data2(i,:),10,'lowess');   
end
for i=1:size(data2,1)
     N_10(i,:)=S_10(i,:)./max(S_10(i,:));  
end
end

