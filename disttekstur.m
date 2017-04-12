function hasil=disttekstur(A,B)
hasil=0;
for i=1:8
temp=sqrt(A(i).mean)-sqrt(B(i).mean);
temp=temp*temp;
hasil=hasil+temp;

temp=sqrt(A(i).deviasi)-sqrt(B(i).deviasi);
temp=temp*temp;
hasil=hasil+temp;
end
end