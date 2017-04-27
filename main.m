file = 'yuhuu.mat';
load(file,'ekstrak')

addpath('/Users/sani/Kuliah/Sem8/TA/dataset')
Q=imread('40.jpg');
figure, imshow(Q);
% Q1=imread('coba.jpg');

ekstrak1=BDIP_BVLC_baru(Q);

srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/dataset/*.jpg');
for i =1 : length(ekstrak)
    hasil(i,1)=squarechord(ekstrak1,ekstrak(i));
    hasil(i,2)=i;
    temp=strsplit(srcFiles(i).name, '.');
    hasil(i,3)=str2double(temp(1));
end

hasil2= sortrows(hasil);

for i=1:10
    filename = strcat('/Users/sani/Kuliah/Sem8/TA/dataset/',srcFiles(hasil2(i,2)).name);
    I=imread(filename);
    subplot(2,5,i), imshow(I);

end

PR=precisonrecall(hasil2, 10, 40);