function st=BDIP_BVLC_baru(Q)

%struct yang berisi color histogram, BVLC, BDIP dari red green blue
field1='colorhis'; val1=[];
field2='merahBDIP'; val2=[];
field3='merahBVLC'; val3=[];
field4='hijauBDIP'; val4=[];
field5='hijauBVLC'; val5=[];
field6='biruBDIP'; val6=[];
field7='biruBVLC'; val7=[];
st(1)=struct(field1,val1,field2,val2,field3,val3,field4,val4,field5,val5,field6,val6,field7,val7);

%select each color of RGB as matrices
 redPlane = Q(:, :, 1);
 greenPlane = Q(:, :, 2);
 bluePlane = Q(:, :, 3);
 
 [r c]=size(redPlane); %r=row c=column
 
%colorhistogram
st.colorhis=colorhistogram(redPlane, greenPlane, bluePlane);

redPlane=padarray(redPlane,[2 2]); %dikasih padding 2 dengan nilai 0
greenPlane=padarray(greenPlane,[2 2]); %dikasih padding 2 dengan nilai 0
bluePlane=padarray(bluePlane,[2 2]); %dikasih padding 2 dengan nilai 0



for x=0:(r/2)-1
    for y=0:(c/2)-1
        s=x*2+3;
        t=y*2+3;
        %block yang sedang dikerjakan untuk warna merah
%         merah= double(redPlane(s:s+1, t:t+1)); %(x,y)
        %menghitung BVLC dan BDIP untuk warna merah
        merahBVLC(x+1,y+1)=hitungBVLC(redPlane,s,t); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        merahBDIP(x+1,y+1)=hitungBDIP(s,t,redPlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
        %block yang sedang dikerjakan untuk warna hijau
%         hijau= double(greenPlane(s:s+1, t:t+1)); %(x,y)
        %menghitung BVLC dan BDIP untuk warna hijau
        hijauBVLC(x+1,y+1)=hitungBVLC(greenPlane,s,t); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        hijauBDIP(x+1,y+1)=hitungBDIP(s,t,greenPlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
        %block yang sedang dikerjakan untuk warna biru
%         biru= double(bluePlane(s:s+1, t:t+1)); %(x,y)
        %menghitung BVLC dan BDIP untuk warna biru
        biruBVLC(x+1,y+1)=hitungBVLC(bluePlane,s,t); %simpan hasil BVLC dengan koordinat dikurangi 2 untuk menghilangkan padding
        biruBDIP(x+1,y+1)=hitungBDIP(s,t,bluePlane); %simpan hasil BDIP dengan koordinat dikurangi 2 untuk menghilangkan padding
        
    end
end

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
st(1).merahBVLC=f_dividearray(merahBVLC);
st(1).merahBDIP=f_dividearray(merahBDIP);

st(1).hijauBVLC=f_dividearray(hijauBVLC);
st(1).hijauBDIP=f_dividearray(hijauBDIP);

st(1).biruBVLC=f_dividearray(biruBVLC);
st(1).biruBDIP=f_dividearray(biruBDIP);
