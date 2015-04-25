image = imread('C:\Users\kushal\Documents\MATLAB\Images\111.jpg'); %input image
M = imread('C:\Users\kushal\Documents\MATLAB\Images\maskFinal.jpg'); %mask image
%t=197;

figure(1);  
imshow(image);

grayImage = rgb2gray(image);

%grayImage = imsharpen(grayImage1);

%[height, width] = size(grayImage);

[pixelCounts, grayLevels] = imhist(grayImage);

pdf = pixelCounts / numel(grayImage);

W1 = zeros(1, 256);
B1 = zeros(1, 256);

for t = 1 : 256
    [W,B] = variance(pdf,t);
    W1(t) = W;
    B1(t) = B;   
end

[M1,I1] = min(W1);
[M2,I2] = max(B1);

t=I1+45;

[BWimg] = thresh(grayImage , t);

 BWimg = imfill(BWimg,'holes');
% 
% h_im = imshow(BWimg);
% 
% e = imellipse(gca,[100 114 33 43]);
% BW = createMask(e,h_im); 

imwrite(BWimg,'C:\\BWfinal.jpg','jpeg');

figure(2);  
imshow(BWimg);


A = BWimg;


[height, width, plane] = size(A);

C = zeros(height,width);

for i = 1:height
    for j = 1:width
      if and(A(i,j) == 255, M(i,j) == 255)
          C(i,j) = 255;
      else
          C(i,j) = 0;
      end
    end
end

imwrite(C,'C:\\Gun.jpg','jpeg');


figure(3);  
imshow(C);

a=imread('C:\\Gun.jpg');
a1=double(a);
m1=[-1,-1,-1;-1,8,-1;-1,-1,-1];

figure(4);                  %Point Detection

res=convn(a1,m1,'same');
imshow(uint8(res));
imwrite(uint8(res),'C:\\pointD.jpg','jpeg');
