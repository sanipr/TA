%function su=sum(x,y)
%   Ii=imread('1346.jpg')
%    Ii=rgb2gray(Ii)
%    su=0
%    for i=0:1
%        for j=0:1
%            %rumus asli 2*x+i dan 2*y+j karena matrix di matlab mulai dari 1 rumusnya jadi seperti di bawah
%            x1=2*(x-1)+i+1 
%            y1=2*(y-1)+j+1 
%            nilai=double(Ii(x1,y1))
%            su=double(nilai+s)
%        end
%    end
%end

I=imread('1346.jpg')
I=rgb2gray(I)
[r c]=size(I)
%I=I(1:4, 1:4)
BVLC1=zeros(200)
imshow(I)
v=5/2

for x=2:r-2
    for y=2:c-2
        I2= double(I(x:x+1, y:y+1)) %(x,y)
        %deviasi & mean xy
        %sumXY=sum(sum(I2))
        s=std2(I2)
        m=mean(mean(I2))
        
        for i=0:1
            for j=0:1
                %rumus asli 2*x+i dan 2*y+j karena matrix di matlab mulai dari 1 rumusnya jadi seperti di bawah
                x1=2*(x-1)+i+1 
                y1=2*(y-1)+j+1 
                if x1>r
                    nilai=0
                elseif y1>c
                    nilai=0
                else
                    nilai=double(I(x1,y1))
                end
                nilai=double(I(x1,y1))
                sumXY=double(nilai+s)
            end
        end
        %sumXY=double(sum(x,y))
        
        I3= double(I(x-1:x, y:y+1)) %(-1,0)
        %deviasi & mean (-1,0)
        s3=std2(I3)
        m3=mean(mean(I3))
                pq(1)=double((sumXY*I3(1,1)-(m*m3*4))/(4*s*s3))
                max=double((sumXY*I3(1,1)-(m*m3*4))/(4*s*s3))
                min=double((sumXY*I3(1,1)-(m*m3*4))/(4*s*s3))
        
        I4= double(I(x:x+1, y-1:y)) %(0,-1)
        %deviasi & mean (0,-1)
        s4=std2(I4)
        m4=mean(mean(I4))
                pq(2)=double((sumXY*I4(1,1)-(m*m4*4))/(4*s*s4))
                %x=(sumXY*I4(1,1)-(m*m4*4))/(4*s*s4)
                %c(2)=((sum(sum(I2)))*(I4(1,1)))-(m*m4*4)
                %a(2)=sumXY*I4(1,1)
                %a(2)=a(2)-(m*m4*4)
                %a(2)=a(2)/4
                %a(2)=a(2)/(s*s4)
                if pq(2)>max
                    max=pq(2)
                    end
                if pq(2)>min
                    min=pq(2)
                    end
                
        I5= double(I(x:x+1, y+1:y+2)) %(0,1)
        %deviasi & mean (0,1)
        s4=std2(I5)
        m4=mean(mean(I5))
                pq(3)=double((sumXY*I5(1,1)-(m*m4*4))/(4*s*s4))
                %a(3)=sumXY* I5(1,1)
                %a(3)=a(3)-(m*m4*4)
                %a(3)=a(3)/4
                %a(3)=a(3)/(s*s4)
                if pq(3)>max
                    max=pq(3)
                end
                if pq(3)>min
                    min=pq(3)
                end
                
        I6= double(I(x+1:x+2, y:y+1)) %(1,0) 
        %deviasi & mean (1,0)
        s4=std2(I6)
        m4=mean(mean(I6))
                pq(4)=double((sumXY*I6(1,1)-(m*m4*4))/(4*s*s4))
                %a(4)=sumXY*I6(1,1)
                %a(4)=a(4)-(m*m4*4)
                %a(4)=a(4)/4
                %a(4)=a(4)/(s*s4)
                if pq(4)>max
                    max=pq(4)
                    end
                if pq(4)>min
                    min=pq(4)
                    end
       
        BVLC1(x,y)=max-min
    end
end

im_BVLC=mat2gray(BVLC1)
figure,imshow(im_BVLC)
title('BVLC')
