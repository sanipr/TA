function f=hitungBDIP(x,y,I2)
I3=I2(x:x+1, y:y+1);
        M=max(max(I3));
        L=sum(sum(I3));
        f=4-(L/M); % rumus dari paper rujukan paper utama
%         f=((4*M)-L)/(4*M); % rumus dari paper utama
        
end

        