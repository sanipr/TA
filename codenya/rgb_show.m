addpath('/Users/sani/Kuliah/Sem8/TA/codenya/link_download/datatraining4')
Q=imread('5.jpg');
figure, imshow(Q);

ekstrak_Q=BDIP_BVLC_baru(Q);

addpath('/Users/sani/Kuliah/Sem8/TA/codenya/link_download/dataset3')
T=imread('12.jpg');
figure, imshow(T);

ekstrak_T=BDIP_BVLC_baru(T);
hasil(7)=zeros;

for i=1:4
    for j=1:4
        for k=1:4
%             menghitung distance untuk color histogram
            a=ekstrak_Q.colorhis(i,j,k);
            b=ekstrak_T.colorhis(i,j,k);
            sc=sqrt(a)-sqrt(b);
            sc=sc*sc;
%             jarak_his(i,j,k)=sc*sc;
            hasil(1)=hasil(1)+sc;
        end
    end
end

for i=1:8
temp=sqrt(ekstrak_Q.merahBDIP(i).mean)-sqrt(ekstrak_T.merahBDIP(i).mean);
temp=temp*temp;
hasil(2)=hasil(2)+temp;

temp=sqrt(ekstrak_Q.merahBDIP(i).deviasi)-sqrt(ekstrak_T.merahBDIP(i).deviasi);
temp=temp*temp;
hasil(2)=hasil(2)+temp;
end

for i=1:8
temp=sqrt(ekstrak_Q.hijauBDIP(i).mean)-sqrt(ekstrak_T.hijauBDIP(i).mean);
temp=temp*temp;
hasil(3)=hasil(3)+temp;

temp=sqrt(ekstrak_Q.hijauBDIP(i).deviasi)-sqrt(ekstrak_T.hijauBDIP(i).deviasi);
temp=temp*temp;
hasil(3)=hasil(3)+temp;
end

for i=1:8
temp=sqrt(ekstrak_Q.biruBDIP(i).mean)-sqrt(ekstrak_T.biruBDIP(i).mean);
temp=temp*temp;
hasil(4)=hasil(4)+temp;

temp=sqrt(ekstrak_Q.biruBDIP(i).deviasi)-sqrt(ekstrak_T.biruBDIP(i).deviasi);
temp=temp*temp;
hasil(4)=hasil(4)+temp;
end

for i=1:8
temp=sqrt(ekstrak_Q.merahBVLC(i).mean)-sqrt(ekstrak_T.merahBVLC(i).mean);
temp=temp*temp;
hasil(5)=hasil(5)+temp;

temp=sqrt(ekstrak_Q.merahBVLC(i).deviasi)-sqrt(ekstrak_T.merahBVLC(i).deviasi);
temp=temp*temp;
hasil(5)=hasil(5)+temp;
end

for i=1:8
temp=sqrt(ekstrak_Q.hijauBVLC(i).mean)-sqrt(ekstrak_T.hijauBVLC(i).mean);
temp=temp*temp;
hasil(6)=hasil(6)+temp;

temp=sqrt(ekstrak_Q.hijauBVLC(i).deviasi)-sqrt(ekstrak_T.hijauBVLC(i).deviasi);
temp=temp*temp;
hasil(6)=hasil(6)+temp;
end

for i=1:8
temp=sqrt(ekstrak_Q.biruBVLC(i).mean)-sqrt(ekstrak_T.biruBVLC(i).mean);
temp=temp*temp;
hasil(7)=hasil(7)+temp;

temp=sqrt(ekstrak_Q.biruBVLC(i).deviasi)-sqrt(ekstrak_T.biruBVLC(i).deviasi);
temp=temp*temp;
hasil(7)=hasil(7)+temp;
end

figure, plot(hasil)

% subplot(1,2,1)
% plot(hasil_retrieve(2:7)), title('retrieved, fitur tekstur');
% 
% subplot(1,2,2)
% plot(hasil_not_retrieve(2:7)), title('not retrieved, fitur tekstur');

% kode ini untuk menampilkan plot hasil jarak suatu gambar Queri terhadap 
% gambar di kategori yang sama tapi tidak ter-retrieve