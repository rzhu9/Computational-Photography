clc;close all; clear;
%Write a main.m script file that reads a given color image file into MATLAB using imread
J = imread('union-terrace.jpg');
%converts it to double so that pixels have values in therange [0..1], 
J = im2double(J);
%calls functions to implement seam carving,
a = shrnk(J, 0, 100);
b = shrnk(J, 100, 0);
c = shrnk(J, 100, 100);
%and then creates an output RGB image as a .jpg image file. 
imwrite(a, 'zhu.1a.jpg');
imwrite(b, 'zhu.1b.jpg');
imwrite(c, 'zhu.1c.jpg');


%E = imenergy(J);
%b1 = imagesc(E);
%saveas(b1, 'zhu.2a.jpg');
%S = horizontal_seam(E);
%[rows, cols, height] = size(J);
%K = zeros(rows, cols, 3);
%for j=1:cols
    %bound = S(j);
    %K(1:bound-1, j, :) = J(1:bound-1, j, :);
    %K(bound+1:rows, j, :) = J(bound+1:rows, j, :);   
%end
%imwrite(K, 'zhu.3.jpg');
%K = permute(K, [2 1 3]);
%E = imenergy(K);
%S = horizontal_seam(E);
%[rows, cols, height] = size(K);
%L = zeros(rows, cols, 3);
%for j=1:cols
    %bound = S(j);
    %L(1:bound-1, j, :) = K(1:bound-1, j, :);
    %L(bound+1:rows, j, :) = K(bound+1:rows, j, :);   
%end
%L = permute(L, [2 1 3]);
%imwrite(L, 'zhu.3.jpg');
%c = shrnk(J, 1, 1);
%imwrite(c, 'zhu.3.jpg')

%J = imread('zhu.4a.jpg');
%J = im2double(J);
%d = shrnk(J, 100, 10);
%imwrite(d, 'zhu.4b.jpg');

%J = imread('zhu.5a.jpg');
%J = im2double(J);
%e = shrnk(J, 100, 10);
%imwrite(e, 'zhu.5b.jpg');

%[rows, cols, height] = size(J);
%hashMap = zeros(rows, cols);
%E = imenergy(J);
%size(E)
%hashMap(:, 1) = E(:, 1);
%size(hashMap)
%for j = 2:cols
    %special case: first row
    %hashMap(1, j) = min(hashMap(1:2, j-1)) + E(1, j);
    %special case: last row
    %hashMap(rows, j) = min(hashMap(rows-1:rows, j-1)) + E(rows, j);
    %for i = 2:(rows-1)
        %hashMap(i, j) = min(hashMap(i-1:i+1, j-1)) + E(i, j);
    %end
%end
%hashMap
%b2 = imagesc(hashMap);
%saveas(b2, 'zhu.2b.jpg');