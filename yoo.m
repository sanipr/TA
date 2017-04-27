srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/dataset/*.jpg');
for i =1 : length(srcFiles)
    filename = strcat('/Users/sani/Kuliah/Sem8/TA/dataset/',srcFiles(i).name);
    I = imread(filename);
%     i=i
    y(i)=BDIP_BVLC_baru(I);
%     hasil(i,1)=squarechord(ekstrak1,ekstrak);
%     hasil(i,2)=i;
%     temp=strsplit(srcFiles(i).name, '.');
%     hasil(i,3)=str2double(temp(1));
%     figure, imshow(I);
end