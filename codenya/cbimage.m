% kode ini buat utak atik hasil ekstrak dan distance

srcFiles= dir('/Users/sani/Kuliah/Sem8/TA/codenya/link_download/datatraining4/*.jpg');
for i=1:length(srcFiles)
    temp=strsplit(srcFiles(i).name, '.');
    nama(i)=str2double(temp(1));
    
        srcFiles2= dir('/Users/sani/Kuliah/Sem8/TA/codenya/link_download/dataset3/*.jpg');
        d=length(srcFiles2);
    for j=1:length(srcFiles2)
        res(j,1)=squarechord(datatraining4(i),dataset3(j));
        res(j,2)=j;
        temp=strsplit(srcFiles2(j).name, '.');
        res(j,3)=str2double(temp(1));
    end

    res2=sortrows(res);

    for k=1:20
        mirip(i,1)=nama(i);
        mirip(i,k+1)=res2(k,3);
    end

    PR(i)=precisonrecall(res2, 12, nama(i));
    
    
end

huh=0;
for i=1:500
    huh=PR(i).precision+huh;
end
weleh=huh/500;

% kode diatas buat tau rata-rata precision sama nyalin 20 nama image yg
% paling mirip
%==========================================================================

% mendapatkan precision recall dari 20 gambar termirip
PR4=PR;
for i=1:250
PR4(i)=precisonrecall(mirip(i,2:21), 20, mirip(i,1));
end
    
% huh=0;
% for i=1:250
%     huh=PR4(i).precision+huh;
% end
% weleh=huh/250;

% merubah struct precision recall ke bentuk cell
PR2=struct2cell(PR4);
% for i=1:length(PR4)
%     PR2(i,1)=PR4(i).dicari;
%     PR2(i,2)=PR4(i).precision;
%     PR2(i,3)=PR4(i).recall;
% end

% menyimpan rata-rata precision setiap kategori
PR2=sortrows(PR2);
for i=0:(length(PR2)/5)-1
    PR2(i*5+1,4)=mean(PR2(i*5+1:i*5+5,2));
end

% menyimpan rata-rata tiap kategori dan di sort
for i=0:99
    PR3(i+1,1)=PR2(i*5+1,1);
    PR3(i+1,2)=PR2(i*5+1,2);
    PR3(i+1,3)=PR2(i*5+1,3);
    PR3(i+1,4)=PR2(i*5+1,4);
end
PR3=sortrows(PR2,4);

%=========================================================================


% i=1;
%     srcFiles2= dir('/Users/sani/Kuliah/Sem8/TA/codenya/link_download/dataset3/*.jpg');
%         d=length(srcFiles2);
%     for j=1:d
%         temp=strsplit(srcFiles2(j).name, '.');
%         temp=str2double(temp(1));
%         tem=fix(temp/100);
%         for k=0:49
%             cb=fix(PR3(500-k,1)/100);
%             if tem==cb
%                 dataset3_50nama(i,1)=temp;
%                 datatrain4_50(i)=datatraining4(j);
%                 i=i+1;
%                 break;
%             end
%         end
%     end

%=========================================================================

% for i=1:250
%     for j=1:1000
%         res(j,1)=squarechord(datatrain4_50(i),dataset3_50(j));
%         res(j,2)=j;
%         res(j,3)=dataset3_50nama(j);
%     end
% 
%     res2=sortrows(res);
% 
%     for k=1:20
%         mirip(i,1)=datatrain4_50nama(i);
%         mirip(i,k+1)=res2(k,3);
%     end
% 
%     PR(i)=precisonrecall(res2, 10, datatrain4_50nama(i));
%     
%     
% end
% 
% huh=0;
% for i=1:250
%     huh=PR(i).precision+huh;
% end
% weleh=huh/250;

