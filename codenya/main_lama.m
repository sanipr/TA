addpath('/Users/sani/Kuliah/Sem8/TA/dataset')
Q=imread('coba.jpg');

%select each color of RGB as matrices
 redPlane = Q(:, :, 1);
 greenPlane = Q(:, :, 2);
 bluePlane = Q(:, :, 3);
 
 [r c]=size(redPlane); %r=row c=column
 
%colorhistogram
colorhis=colorhistogram(redPlane, greenPlane, bluePlane);

redPlane=padarray(redPlane,[2 2]); %dikasih padding 2 dengan nilai 0
greenPlane=padarray(greenPlane,[2 2]); %dikasih padding 2 dengan nilai 0
bluePlane=padarray(bluePlane,[2 2]); %dikasih padding 2 dengan nilai 0



for x=0:(r/2)-1
    for y=0:(c/2)-1
        s=x*2+3;
        t=y*2+3;
        %block yang sedang dikerjakan untuk warna merah
        merah= double(redPlane(s:s+1, t:t+1)); %(x,y)
        %menghitung BVLC dan BDIP untuk warna merah
        merahBVLC(x+1,y+1)=hitungBVLC(redPlane,merah,s,t); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        merahBDIP(x+1,y+1)=hitungBDIP(s,t,redPlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
        %block yang sedang dikerjakan untuk warna hijau
        hijau= double(greenPlane(s:s+1, t:t+1)); %(x,y)
        %menghitung BVLC dan BDIP untuk warna hijau
        hijauBVLC(x+1,y+1)=hitungBVLC(greenPlane,hijau,s,t); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        hijauBDIP(x+1,y+1)=hitungBDIP(s,t,greenPlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
        %block yang sedang dikerjakan untuk warna biru
        biru= double(bluePlane(s:s+1, t:t+1)); %(x,y)
        %menghitung BVLC dan BDIP untuk warna biru
        biruBVLC(x+1,y+1)=hitungBVLC(bluePlane,biru,s,t); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        biruBDIP(x+1,y+1)=hitungBDIP(s,t,bluePlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
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
