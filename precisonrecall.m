function lol=precisonrecall(hasil2, batas, cq)
jmlh=0;
for i=1:batas
    a=fix(cq/100)
    b=fix(hasil2(i,3)/100)
    if a==b
    jmlh=jmlh+1;
    end
end
lol(1)=jmlh/batas*100; %precision
lol(2)=jmlh/40*100; %recall
end

% fungsi ini menghitung precision dan recall dengan input hasil2=hasil sort
% semua distance image; batas=jumlah hasil teratas atau top N; cq= adalah
% index gambar query(namafile)