Q=imread('1346.jpg');
Q=rgb2gray(Q)
%Q=Q(1:20, 1:20)
Q=padarray(Q,[2 2]); %dikasih padding 2 dengan nilai 0
[r c]=size(Q); %r=row c=column
%BVLC1=zeros(20)
imshow(Q);

for x=3:r-2
    for y=3:c-2
        Q2= double(Q(x:x+1, y:y+1)); %(x,y)
        %deviasi & mean xy
        %sumXY=sum(sum(I2))
        s=std2(Q2);
        m=mean(mean(Q2));
        shift(1)=nilaipershift1(Q,x,y);
        shift(2)=nilaipershift2(Q,x,y);
        shift(3)=nilaipershift3(Q,x,y);
        shift(4)=nilaipershift4(Q,x,y);
        max=shift(1);
        min=shift(1);
        %max=max(shift)
        %min=min(shift)
                if shift(2)>max
                  max=shift(2);
                end
                 
                if shift(2)<min
                    min=shift(2);
                end
                                  
                if shift(3)>max
                    max=shift(3);
                end
                if shift(3)<min
                    min=shift(3);
                end
                
                if shift(4)>max
                    max=shift(4);
                end
                    
                if shift(4)<min
                    min=shift(4);
                end
                    
        BVLC2(x-2,y-2)=max-min; %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        BDIP3(x-2,y-2)=hitungBDIP(x,y,Q); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
    end
end

im_BVLC1=mat2gray(BVLC2);
figure,imshow(im_BVLC1);
title('BVLC');

im_BDIP=mat2gray(BDIP3);
figure,imshow(im_BDIP);
title('BDIP');

%[ro co]=size(BVLC1);
%[row col]=size(BDIP2);

%merubah matrix 2-D ke 1-D
%BVLC1=reshape(BVLC1,[1,ro*co]);
%BDIP2=reshape(BDIP2,[1,row*col]);

%sort matrix 1-D
%BVLC1=sort(BVLC1);
%BDIP2=sort(BDIP2);
