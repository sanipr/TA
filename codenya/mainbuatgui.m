function result=mainbuatgui(filepath, filename, jmlh)

field1='mirip';value1=[];
field2='PR';value2=[];
result=struct(field1,value1,field2,value2);

addpath('/Users/sani/Kuliah/Sem8/TA/codenya/mat')
file = 'datatraining4dataset3.mat';
load(file,'dataset3')

addpath(filepath);
Q=imread(filename);
fn=strsplit(filename,'.');
fn=str2double(fn(1));

ekstrak1=BDIP_BVLC_baru(Q);

srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/codenya/link_download/dataset3/*.jpg');
for i =1 : length(dataset3)
    hasil(i,1)=squarechord(ekstrak1,dataset3(i));
    hasil(i,2)=i;
    temp=strsplit(srcFiles(i).name, '.');
    hasil(i,3)=str2double(temp(1));
end

hasil2= sortrows(hasil);


% for i=1:12
%     filename1 = strcat('/Users/sani/Kuliah/Sem8/TA/codenya/link_download/dataset3/',srcFiles(hasil2(i,2)).name);
%     I=imread(filename);
%     subplot(2,6,i), imshow(I);
% end

PR=precisonrecall(hasil2, jmlh, fn);
result.mirip=hasil2;
result.PR=PR;