function [test_filtered]=filteringcheck(pretesting,ilogic)


test_filtered=pretesting;

% % indices generation
f=1:48;  a=floor((f-1)/8)+1; b=mod(f,8);    b(b==0)=8;
a(a==1)=11;a(a==2)=22;a(a==3)=33;a(a==4)=44;a(a==5)=55;a(a==6)=66;
a(a==11)=1;a(a==22)=2;a(a==33)=3;a(a==44)=5;a(a==55)=6;a(a==66)=4;
q=1;
for k=1:6*8
    for j=1:size(pretesting,1)/(6*8)
        val=(size(pretesting,1)/(6*8))*(k-1)+j;
%         datamatrix{1}=test_filtered{val,1}; datamatrix{2}=test_filtered{val,1}; datamatrix{3}=test_filtered{val,1}; datamatrix{4}=test_filtered{val,1}; datamatrix{5}=test_filtered{val,1}; datamatrix{6}=test_filtered{val,1};
%         matrix{1}=ilogic{1,b(q)}; matrix{2}=ilogic{2,b(q)}; matrix{3}=ilogic{3,b(q)}; matrix{4}=ilogic{4,b(q)}; matrix{5}=ilogic{5,b(q)}; matrix{6}=ilogic{6,b(q)};
%         for i=1:6
%             datamatrix{i}(matrix{i})=0;
%             count(i)= sum(sum(datamatrix{i}(:,4:1003)));
%         end
%         [~,index]=max(count);
%         test_filtered{val,1}(matrix{index})=0;
        matrix=ilogic{a(q),b(q)};
        test_filtered{val,1}(matrix)=0;
    end
    q=q+1;
end
end
