function colorhis= colorhistogram(red, green, blue)
% Q=imread('1346.jpg');
% [r c d]=size(Q); %r=row c=column
% 
% %select each color of RGB as matrices
%  red = Q(:, :, 1);
%  green = Q(:, :, 2);
%  blue = Q(:, :, 3);

% ukuran matrix
 [r c]=size(red); %r=row c=column
 
%  inisialisasi
for indexR=1:4
    for indexG=1:4
        for indexB=1:4
            colorhis(indexR,indexG,indexB)=0;
        end
    end
end

% 
for i=1:r
    for j=1:c
% menyimpan index dengan mengelompokkan nilai warna ke 4 interval
% hasilnya ditambah 1 karena matrix pada matlab dimulai dari 1 
    indexR=floor(double(red(i,j))/64)+1 ;
    indexG=floor(double(green(i,j))/64)+1;
    indexB=floor(double(blue(i,j))/64)+1;

% warna dengan index sama akan ditambah 1 jumlahnya
    colorhis(indexR,indexG,indexB)=colorhis(indexR,indexG,indexB)+1;
    end
end
end


% pada code ini akan menyimpan histogram warna merah, hijau dan biru
% pada masing-masing warna nilai warna akan dikelompokkan menjadi 4, dengan interval 0-63, 64-127, 128-191, 192-255