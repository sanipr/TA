addpath('/Users/sani/Kuliah/Sem8/TA/mat')
file = 'datatraining1_500data.mat';
load(file,'dataset');
file2 = 'ekstrak_training2.mat';
load(file2,'datatraining2');

srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/datatraining2/*.jpg');
for i=1:length(srcFiles)
    temp=strsplit(srcFiles(i).name, '.');
    nama(i)=str2double(temp(1));
    
        srcFiles2= dir('/Users/sani/Kuliah/Sem8/TA/datasett/*.jpg');
        d=length(srcFiles2);
    for j=1:length(srcFiles2)
        res(j,1)=squarechord(datatraining2(i),dataset(j));
        res(j,2)=j;
        temp=strsplit(srcFiles2(j).name, '.');
        res(j,3)=str2double(temp(1));
    end

    res2=sortrows(res);

    for k=1:20
        mirip(i,1)=nama(i);
        mirip(i,k+1)=res2(k,3);
    end

    PR(i)=precisonrecall(res2, 10, nama(i));
    
    
end

huh=0;
for i=1:500
    huh=PR(i).precision+huh;
end
weleh=huh/500;



% kode ini untuk menghitung jarak suatu data tes terhadap data training dan
% akan menyimpan 20 citra yang paling dekat dan menghitung precision dan
% recall