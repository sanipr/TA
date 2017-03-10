%shift bawah
function jum4=nilaipershift4(I,x,y)
    jum4=0;
        for i=0:1
            for j=0:1
                x1=x+i-1;
                y1=y+j+0;
                xy=double(I(x+i,y+j)); %nilai anggota dalam blok
                kl=double(I(x+i+1,y+j+0)); %nilai piksel bagian bawah anggota blok
                jum4=double((xy*kl)+jum4);
            end
        end
        %deviasi & mean dari block
        s=std2(I(x:x+1, y:y+1));
        m=mean(mean(I(x:x+1, y:y+1)));
        
        I2= double(I(x+1:x+2, y:y+1)); %(1,0) blok shift bawah
        %deviasi & mean (1,0)
        s2=std2(I2);
        m2=mean(mean(I2));
        %menghitung BVLC shift bawah
        jum4=double(jum4-(4*m*m2));
        jum4=double(jum4/(4*s*s2));
end