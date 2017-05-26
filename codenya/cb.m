% kode ini buat bikin link download dataset

k=25;
o=1;
h=1;
for j=1:100
for i=1:50
    k=k+1;
%     if mod(k,5)==0
%        hoho(h)=k;
%        h=h+1;
%     else
%         arr(o)=k;
%         o=o+1;
%     end
    arr(o)=k;
    o=o+1;
    
end
k=k
k=k+50
end
% for i=1:10000
%     arr(i)=i;
% end
fprintf('http://www.ci.gxnu.edu.cn/cbir/Corel/%d.jpg\n',arr);

srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/datatraining/*.jpg');
length(srcFiles)