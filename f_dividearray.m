function st=f_dividearray(q)
%q=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26]

%struct yang berisi deviasi dan mean pada setiap bagian
field1='deviasi';value1=0;
field2='mean';value2=0;
st=struct(field1,value1,field2,value2);

[r c]=size(q); %ukuran array
k=fix(c/8); %banyaknya anggota per bagian
mo=mod(c,8); %sisa pembagian jika ukuran array bukan kelipatan 8 akan didistribusi ke setiap bagian satu per satu
mo=8-mo; %untuk pembatas 
a=1; %untuk membantu menghitung index
% s=q(20617:20617+k) %bagian ke 8 
for i=1 : 8
    %membagi array menjadi 8 bagian
    if i>mo
        %jika jumlah data pada array bukan kelipatan 8, kelebihannya akan
        %ditambahkan satu per satu ke bagian ke (i) paling akhir
%         i=i
%         a=a
        p=q(a:a+k);
        a=a+k+1;
    else
        p=q(a:a+k-1);
        a=a+k;
    end
    
    %setiap bagian langsung dihitung deviasi dan rata2 nya
    %standar deviasi setiap bagian ke(i)
    st(i).deviasi=std2(p);
    %rata2 setiap baggian ke(i)
    st(i).mean=mean(p);
    
end
end

%penjelasan: fungsi ini digunakan untuk mendapatkan masing-masing 8 nilai
%deviasi dan rata2 dari matrix BVLC dan BDIP yang telah disort dan dibagi menjadi 8 bagian
