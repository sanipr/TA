addpath('/Users/sani/Kuliah/Sem8/TA/codenya/dataset');
% R=imread('25.jpg');
% figure, imshow(x(:,:,1)); % Red component
% 
% figure, imshow(x(:,:,2)); % Green component
% 
% figure, imshow(x(:,:,3)); % Blue component

X=imread('25.jpg');
R = X
R(:,:,2:3) = 0;
figure, image(R); %show red
G = X;
G(:,:,[1 3]) = 0;
figure, image(G); %show green
B = X;
B(:,:,1:2) = 0;
figure, image(B); %show blue
