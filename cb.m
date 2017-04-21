k=100;
o=1;
for j=1:50
for i=1:40
    k=k+1;
    arr(o)=k;
    o=o+1;
end
k=k+60;
end

fprintf('http://www.ci.gxnu.edu.cn/cbir/Corel/%d.jpg\n',arr);
