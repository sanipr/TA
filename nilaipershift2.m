%shift kiri
function jum2=nilaipershift2(I,x,y)
    
        %deviasi & mean dari block
        s=std2(I(x:x+1, y:y+1));
        m=mean(mean(I(x:x+1, y:y+1)));
        
        I2= double(I(x:x+1, y-1:y)); %(0,-1) blok shift kiri
        %deviasi & mean (0,-1)
        s2=std2(I2);
        m2=mean(mean(I2));
        
        pembagi=4*s*s2;
        if pembagi==0
            jum2=0;
        else
            jum2=0;
            for i=0:1
                for j=0:1
                    x1=x+i-1;
                    y1=y+j+0;
                    xy=double(I(x+i,y+j)); %nilai anggota dalam blok
                    kl=double(I(x+i+0,y+j-1)); %nilai piksel sebelah kiri anggota blok
                    jum2=double((xy*kl)+jum2);
                end
            end
        
            %menghitung BVLC shift kiri
            jum2=double(jum2-(4*m*m2));
            jum2=double(jum2/pembagi);
        end
        
end