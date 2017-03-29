Q=imread('coba.jpg');

%select each color of RGB as matrices
 redPlane = Q(:, :, 1);
 greenPlane = Q(:, :, 2);
 bluePlane = Q(:, :, 3);
 
%colorhistogram
colorhis=colorhistogram(redPlane, greenPlane, bluePlane);

redPlane=padarray(redPlane,[2 2]); %dikasih padding 2 dengan nilai 0
greenPlane=padarray(greenPlane,[2 2]); %dikasih padding 2 dengan nilai 0
bluePlane=padarray(bluePlane,[2 2]); %dikasih padding 2 dengan nilai 0

[r c]=size(redPlane); %r=row c=column

for x=3:r-2
    for y=3:c-2
        %block yang sedang dikerjakan untuk warna merah
        merah= double(redPlane(x:x+1, y:y+1)); %(x,y)
        %menghitung BVLC dan BDIP untuk warna merah
        merahBVLC(x-2,y-2)=hitungBVLC(redPlane,merah,x,y); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        merahBDIP(x-2,y-2)=hitungBDIP(x,y,redPlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
        %block yang sedang dikerjakan untuk warna hijau
        hijau= double(greenPlane(x:x+1, y:y+1)); %(x,y)
        %menghitung BVLC dan BDIP untuk warna hijau
        hijauBVLC(x-2,y-2)=hitungBVLC(greenPlane,hijau,x,y); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        hijauBDIP(x-2,y-2)=hitungBDIP(x,y,greenPlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
        %block yang sedang dikerjakan untuk warna biru
        biru= double(bluePlane(x:x+1, y:y+1)); %(x,y)
        %menghitung BVLC dan BDIP untuk warna biru
        biruBVLC(x-2,y-2)=hitungBVLC(bluePlane,biru,x,y); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        biruBDIP(x-2,y-2)=hitungBDIP(x,y,bluePlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
        
    end
end

im_BVLC1=mat2gray(merahBVLC);
figure,imshow(im_BVLC1);
title('merahBVLC');

im_BDIP=mat2gray(merahBDIP);
figure,imshow(im_BDIP);
title('merahBDIP');

  [ro co]=size(merahBVLC);

%merubah matrix 2-D ke 1-D
merahBVLC=reshape(merahBVLC,[1,ro*co]);
merahBDIP=reshape(merahBDIP,[1,ro*co]);

hijauBVLC=reshape(hijauBVLC,[1,ro*co]);
hijauBDIP=reshape(hijauBDIP,[1,ro*co]);

biruBVLC=reshape(biruBVLC,[1,ro*co]);
biruBDIP=reshape(biruBDIP,[1,ro*co]);

%sort matrix 1-D
merahBVLC=sort(merahBVLC);
merahBDIP=sort(merahBDIP);

hijauBVLC=sort(hijauBVLC);
hijauBDIP=sort(hijauBDIP);

biruBVLC=sort(biruBVLC);
biruBDIP=sort(biruBDIP);

%mendapatkan nilai deviasi dan rata2 dari 8 bagian 
merahBVLC=f_dividearray(merahBVLC);
merahBDIP=f_dividearray(merahBDIP);

hijauBVLC=f_dividearray(hijauBVLC);
hijauBDIP=f_dividearray(hijauBDIP);

biruBVLC=f_dividearray(biruBVLC);
biruBDIP=f_dividearray(biruBDIP);
