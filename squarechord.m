function hasil=squarechord(Q,Q1) %Q=nilai  Q1=nilai query
hasil=0;
for i=1:4
    for j=1:4
        for k=1:4
            a=Q(1).colorhis(i,j,k);
            b=Q1(1).colorhis(i,j,k);
            sc=sqrt(a)-sqrt(b);
            sc=sc*sc;
            hasil=hasil+sc;
        end
    end
end

hasil=hasil+disttekstur(Q(1).merahBDIP,Q1(1).merahBDIP);
hasil=hasil+disttekstur(Q(1).merahBVLC,Q1(1).merahBVLC);
hasil=hasil+disttekstur(Q(1).hijauBDIP,Q1(1).hijauBDIP);
hasil=hasil+disttekstur(Q(1).hijauBVLC,Q1(1).hijauBVLC);
hasil=hasil+disttekstur(Q(1).biruBDIP,Q1(1).biruBDIP);
hasil=hasil+disttekstur(Q(1).biruBVLC,Q1(1).biruBVLC);


end

