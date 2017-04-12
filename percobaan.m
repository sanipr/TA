addpath('/Users/sani/Kuliah/Sem8/TA/dataset')
Q=imread('223.jpg');
% Q1=imread('coba.jpg');

ekstrak1=BDIP_BVLC_baru(Q);
% Q1struct=BDIP_BVLC_baru(Q1);

% hasil(1)=squarechord(Qstruct,Q1struct);
% hasil(2)=squarechord(Qstruct,Qstruct);

srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/dataset/*.jpg');
for i =1 : length(srcFiles)
    filename = strcat('/Users/sani/Kuliah/Sem8/TA/dataset/',srcFiles(i).name);
    I = imread(filename);
    ekstrak=BDIP_BVLC_baru(I);
    hasil(i,1)=squarechord(ekstrak1,ekstrak);
    hasil(i,2)=i;
%     figure, imshow(I);
end

hasil2= sortrows(hasil);
for i=1:5
    filename = strcat('/Users/sani/Kuliah/Sem8/TA/dataset/',srcFiles(hasil2(i,2)).name);
    I=imread(filename);
    figure, imshow(I);
end



