function [output_image]  = myhisteq( input_image )
%implement in MATLAB a function that performs histogram equalization by 
 %(1) converting an input color image from RGB to HSV color space 
 %(using rgb2hsv which creates a double image), 
 input_image = rgb2hsv(input_image);
 %(2) computing the histogram and cumulative histogram of the V (luminance)
 %image only, 
 V = im2uint8(input_image(:,:,3));
 [Hist,val] = imhist(V);
 CumHist = cumsum(Hist);
 %figure; 
 %imhist(V);
 %(3) transforming the intensity values in V to occupy the full range
 %0..255 in a new image W so that the histogram of W is roughly ?flat,? and
 [rows,cols] = size(V);
 tot_Pixel = rows * cols;
 W = zeros(size(V,1), size(V,2));
 for i=1:rows
    for j=1:cols
        W(i,j) = max(0,(256/tot_Pixel)*CumHist(V(i,j)+1));
    end
 end 
W1 = uint8(W);
%figure;
%imhist(W1);
 %(4) combining the original H and S channels with the W image tocreate a
 %new color image, which is then converted to an RGB color output image 
 %(using hsv2rgb).
 input_image = im2uint8(input_image);
 input_image(:,:,3) = W;
 input_image = im2double(input_image);
 output_image = hsv2rgb(input_image); 
end

