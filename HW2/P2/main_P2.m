clear
%img1 = imread('P2-union-raw.bmp');
%output1 = mydemosaic(img1);
%imwrite(output1, 'P2-union-demosaic.jpg', 'jpg');
%created = imread('P2-union-demosaic.jpg');
%raw = imrotate(imread('P2-union.jpg'),90);
%output2 = compare(created,raw);
%imwrite(output2, 'P2-union-error.jpg');

clc;

%img2 = imread('P2-crayons-raw.bmp');
%output3 = mydemosaic(img2);
%imwrite(output3, 'P2-crayons-demosaic.jpg', 'jpg');
%created = imread('P2-crayons-demosaic.jpg');
%raw = imrotate(imread('P2-crayons.jpg'),0);
%output4 = compare(created,raw);
%imwrite(output4, 'P2-crayon-error.jpg');
clc;


img3 = imread('echo.bmp');
output5 = mydemosaic(img3);
imwrite(output5, 'echo2.jpg', 'jpg');