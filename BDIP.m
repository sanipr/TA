I = imread('1346.jpg')
I2= rgb2gray(I)
[r c]=size(I2)
%BDIP1=zeros(200)
%I2=gray(1:126, 1:187)
%imshow(I2)
for x=1:r-1
    for y=1:c-1
    	BDIP1(x,y)=hitungBDIP(x,y,I2)
        %BDIP(x,y)= ((4*M)-L)/(M)
    end
end
im_BDIP=mat2gray(BDIP1)
figure,imshow(im_BDIP)
title('BDIP')

%imshow(gray)
%[r c]=size(gray)
%for R=0:num of Rows
 %   for C=0:num of Columns
  %      BDIP=gray(r c)
   %     imageArray = [gray(R)]