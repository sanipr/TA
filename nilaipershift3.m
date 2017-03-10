%shift kanan
function jum3=nilaipershift3(I,x,y)
    jum3=0;
        for i=0:1
            for j=0:1
                x1=x+i-1;
                y1=y+j+0;
                xy=double(I(x+i,y+j)); %nilai anggota dalam blok
                kl=double(I(x+i+0,y+j+1)); %nilai piksel sebelah kanan anggota blok
                jum3=double((xy*kl)+jum3); %menambahkan semua hasil kali xy dan kl
            end
        end
        %deviasi & mean dari block
        s=std2(I(x:x+1, y:y+1));
        m=mean(mean(I(x:x+1, y:y+1)));
        
        I2= double(I(x:x+1, y+1:y+2)); %(0,1) blok shift kanan
        %deviasi & mean (0,1)
        s2=std2(I2);
        m2=mean(mean(I2));
        %menghitung BVLC shift kanan
        jum3=double(jum3-(4*m*m2));
        jum3=double(jum3/(4*s*s2));
end