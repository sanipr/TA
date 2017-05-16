Q=imread('coba.jpg');

%select each color of RGB as matrices
% redPlane = Q(:, :, 1);
%  greenPlane = Q(:, :, 2);
bluePlane = Q(:, :, 3);
% redPlane=padarray(redPlane,[2 2]); %dikasih padding 2 dengan nilai 0
% greenPlane=padarray(greenPlane,[2 2]); %dikasih padding 2 dengan nilai 0
% bluePlane=padarray(bluePlane,[2 2]); %dikasih padding 2 dengan nilai 0

%gray image
%Q=rgb2gray(Q);
gr=rgb2gray(Q);
Q=bluePlane;
Q=padarray(Q,[2 2]); %dikasih padding 2 dengan nilai 0
[r c]=size(Q); %r=row c=column

for x=3:r-2
    for y=3:c-2
        %block yang sedang dikerjakan
        Q2= double(Q(x:x+1, y:y+1)); %(x,y)
        
        %menghitung deviasi & mean xy (blok yang sedang dikerjakan)
        s=std2(Q2);
        m=mean(mean(Q2));
        
        %menghitung nilai pershift
        shift(1)=nilaipershift1(Q,x,y);
        shift(2)=nilaipershift2(Q,x,y);
        shift(3)=nilaipershift3(Q,x,y);
        shift(4)=nilaipershift4(Q,x,y);
        %mendapatkan nilai tertinggi dan terendah dari hasil shift
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

% im_BVLC1=mat2gray(BVLC2);
% figure,imshow(im_BVLC1);
% title('BVLC');
% 
% im_BDIP=mat2gray(BDIP3);
% figure,imshow(im_BDIP);
% title('BDIP');

[ro co]=size(BVLC2);
[row col]=size(BDIP3);

%merubah matrix 2-D ke 1-D
BVLC2=reshape(BVLC2,[1,ro*co]);
BDIP3=reshape(BDIP3,[1,row*col]);

%sort matrix 1-D
BVLC2=sort(BVLC2);
BDIP3=sort(BDIP3);

%mendapatkan nilai deviasi dan rata2 dari 8 bagian 
BVLC2=f_dividearray(BVLC2);
BDIP3=f_dividearray(BDIP3);

%code ini adalah percobaan untuk menghitung BDIP dan BVLC secara bersamaan pada suatu image