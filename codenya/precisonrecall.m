function lol=precisonrecall(hasil2, batas, nama)

%struct yang berisi precision dan recall
field1='dicari'; val1=[];
field2='precision'; val2=[];
field3='recall'; val3=[];
lol=struct(field1,val1,field2,val2,field3,val3);

jmlh=0;
for i=1:batas
    a=fix(nama/100);
%     b=fix(hasil2(1,i)/100);
    b=fix(hasil2(i,3)/100);
    if a==b
    jmlh=jmlh+1;
    end
end
lol.dicari=nama;
lol.precision=jmlh/batas*100; %precision
lol.recall=jmlh/20*100; %recall
end

% fungsi ini menghitung precision dan recall dengan input hasil2=hasil sort
% semua distance image; batas=jumlah hasil teratas atau top N; nama= adalah
% nama gambar yang dicari(namafile)