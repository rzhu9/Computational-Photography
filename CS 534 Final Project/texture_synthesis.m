function [ input_image2 ] = texture_synthesis(horizontal_seam, input_image)
%TEXTURE_SYNTHESIS Summary of this function goes here
%   Detailed explanation goes here
%input_image = imread('jeremy zhu.jpg');
%input_image = im2double(input_image);
%input_image = im2uint8(input_image);
% get the list of background images
input_image_row = size(input_image, 1);
input_image_col = size(input_image, 2);
%horizontal_seam = randperm(input_image_row, input_image_col);
% step1: seperate the sky from imput image using given horizontal seam
input_sky_row = max(horizontal_seam);
input_sky_col = input_image_col;
input_sky = ones(input_sky_row,input_sky_col, 3);
for i = 1 : input_sky_col
    bound = horizontal_seam(i);
    bound2 = bound -1;
    input_sky(1:bound2, i, :) = input_image(1:bound2, i, :);
end

% step2: check whether image is day or night
dark = 0;
light = 0;
I2 = rgb2gray(input_image);
for i = 1 : input_sy_col
    for j = 1 : horizontal_seam(i)
        if (abs(I2(j, i) - 0) > abs(I2(j, i) - 1))
            light = light + 1;    
        else
            dark = dark + 1;
        end
    end
end
% step3: image similarize on input image's sky part and list of background
% to select the best candidate from the list of background
background1 = imread('background/1.jpg');
background2 = imread('background/2.jpg');
background3 = imread('background/3.jpg');
background4 = imread('background/4.jpg');
background5 = imread('background/5.jpg');
background6 = imread('background/6.jpg');
background7 = imread('background/7.jpg');
background8 = imread('background/8.jpg');
background9 = imread('background/9.jpg');
background10 = imread('background/10.jpg');
% provide a light or dark background
if (light > dark)
    best_candidate = background1;
else
    best_candidate = background10;
end
best_candidate = background7;
% select the best candidate
%best_candidate = background2;
% step4: resize the selected candidate so that it has same length of input
% image and width equal to the maximum value of horizontal seam
best_candidate = im2double(best_candidate);
row_difference = size(best_candidate, 1) - input_sky_row;
col_difference = size(best_candidate, 2) - input_sky_col;
resize_best_candidate = shrnk(best_candidate, row_difference, col_difference); 
% step5: paste the selected candidate to the blank part of input image
input_image2 = input_image;
for i = 1 : input_image_col
    bound = horizontal_seam(i);
    bound2 = bound -1;
    input_image2(1:bound2, i, :) = resize_best_candidate(1:bound2, i, :);
end
% step6: return output image: input_image2
%output_image = input_sky;
%size(input_sky);
%imwrite(input_image2, 'zhu 2.jpg');
end

