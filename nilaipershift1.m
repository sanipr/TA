%shift atas
function jum1=nilaipershift1(I,x,y)
    jum1=0;
        for i=0:1
            for j=0:1
                x1=x+i-1;
                y1=y+j+0;
                xy=double(I(x+i,y+j)); %nilai anggota dalam blok
                kl=double(I(x+i-1,y+j+0)); %nilai piksel bagian atas anggota blok
                jum1=double((xy*kl)+jum1); %menambahkan semua hasil kali xy dan kl
            end
        end
        %deviasi & mean dari block
        s=std2(I(x:x+1, y:y+1));
        m=mean(mean(I(x:x+1, y:y+1)));
        
        I2= double(I(x-1:x, y:y+1)); %(-1,0) blok shift atas
        %deviasi & mean (-1,0)
        s2=std2(I2);
        m2=mean(mean(I2));
        %menghitung BCLV shift atas
        jum1=double(jum1-(4*m*m2));
        jum1=double(jum1/(4*s*s2));
end