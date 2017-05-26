addpath('/Users/sani/Kuliah/Sem8/TA/codenya')
Q=imread('972.jpg');
figure, imshow(Q);

redPlane = Q(:, :, 1);
greenPlane = Q(:, :, 2);
bluePlane = Q(:, :, 3);

[r c]=size(redPlane); %r=row c=column

redPlane=padarray(redPlane,[2 2]); %dikasih padding 2 dengan nilai 0
greenPlane=padarray(greenPlane,[2 2]); %dikasih padding 2 dengan nilai 0
bluePlane=padarray(bluePlane,[2 2]); %dikasih padding 2 dengan nilai 0

for x=0:(r/2)-1
    for y=0:(c/2)-1
        s=x*2+3;
        t=y*2+3;
        %menghitung BVLC dan BDIP untuk warna merah
        merahBVLC(x+1,y+1)=hitungBVLC(redPlane,s,t); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        merahBDIP(x+1,y+1)=hitungBDIP(s,t,redPlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
        %menghitung BVLC dan BDIP untuk warna hijau
        hijauBVLC(x+1,y+1)=hitungBVLC(greenPlane,s,t); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        hijauBDIP(x+1,y+1)=hitungBDIP(s,t,greenPlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
        %menghitung BVLC dan BDIP untuk warna biru
        biruBVLC(x+1,y+1)=hitungBVLC(bluePlane,s,t); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        biruBDIP(x+1,y+1)=hitungBDIP(s,t,bluePlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
    end
end

% menampilkan hasil ekstrak per rgb dalam bentuk gray
subplot(2,3,1);
BDIP=mat2gray(merahBDIP);
imshow(BDIP);
title('merahBDIP');

subplot(2,3,2);
BDIP=mat2gray(hijauBDIP);
imshow(BDIP);
title('hijauBDIP');

subplot(2,3,3);
BDIP=mat2gray(biruBDIP);
imshow(BDIP);
title('biruBDIP');

subplot(2,3,4);
BVLC=mat2gray(merahBVLC);
imshow(BVLC);
title('merahBVLC');

subplot(2,3,5);
BVLC=mat2gray(hijauBVLC);
imshow(BVLC);
title('hijauBVLC');

subplot(2,3,6);
BVLC=mat2gray(biruBVLC);
imshow(BVLC);
title('biruBVLC');

% R = merahBDIP;
% R(:,:,2:3) = 0;
% figure, image(R); %show red
% G = hijauBDIP;
% G(:,:,[1 3]) = 0;
% figure, image(G); %show green
% B = biruBDIP;
% B(:,:,1:2) = 0;
% figure, image(B); %show blue



% kode ini untuk menampilkan hasil ekstrak BDIP BVLC per RGB