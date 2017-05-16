function hasil= hitungBVLC(Q,x,y)
%menghitung deviasi & mean xy (blok yang sedang dikerjakan)
%         s=std2(Q2);
%         m=mean(mean(Q2));
        %menghitung nilai pershift
        shift(1)=nilaipershift1(Q,x,y);
        shift(2)=nilaipershift2(Q,x,y);
        shift(3)=nilaipershift3(Q,x,y);
        shift(4)=nilaipershift4(Q,x,y);
        %mendapatkan nilai tertinggi dan terendah dari hasil shift
        max=shift(1);
        min=shift(1);
        %max=max(shift)
        %min=min(shift)
                if shift(2)>max
                  max=shift(2);
                end
                 
                if shift(2)<min
                    min=shift(2);
                end
                                  
                if shift(3)>max
                    max=shift(3);
                end
                if shift(3)<min
                    min=shift(3);
                end
                
                if shift(4)>max
                    max=shift(4);
                end
                    
                if shift(4)<min
                    min=shift(4);
                end
                
                %hasil BVLC adalah nilai tertinggi dari semua nilai shift
                %dikuranginilai terendah
                hasil=max-min;
end