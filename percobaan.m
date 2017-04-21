addpath('/Users/sani/Kuliah/Sem8/TA/dataset')
Q=imread('40.jpg');
figure, imshow(Q);
% Q1=imread('coba.jpg');

ekstrak1=BDIP_BVLC_baru(Q);
% Q1struct=BDIP_BVLC_baru(Q1);

% hasil(1)=squarechord(Qstruct,Q1struct);
% hasil(2)=squarechord(Qstruct,Qstruct);

srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/dataset/*.jpg');
for i =1 : length(srcFiles)
    filename = strcat('/Users/sani/Kuliah/Sem8/TA/dataset/',srcFiles(i).name);
    I = imread(filename);
%     i=i
    ekstrak=BDIP_BVLC_baru(I);
    hasil(i,1)=squarechord(ekstrak1,ekstrak);
    hasil(i,2)=i;
    temp=strsplit(srcFiles(i).name, '.');
    hasil(i,3)=str2double(temp(1));
%     figure, imshow(I);
end

hasil2= sortrows(hasil);
for i=1:10
    filename = strcat('/Users/sani/Kuliah/Sem8/TA/dataset/',srcFiles(hasil2(i,2)).name);
    I=imread(filename);
    subplot(1,5,i), imshow(I)
%     figure, imshow(I);
end

PR=precisonrecall(hasil2, 10, 40);



