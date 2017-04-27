k=95;
o=1;
for j=1:100
for i=1:5
    k=k+1;
    arr(o)=k;
    o=o+1;
end
k=k+95;
end

fprintf('http://www.ci.gxnu.edu.cn/cbir/Corel/%d.jpg\n',arr);

srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/datatraining/*.jpg');
length(srcFiles)