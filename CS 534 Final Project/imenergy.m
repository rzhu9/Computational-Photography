%Implement a function E = imenergy(I) (in a file called imenergy.m ) that computes the
%energy image E from an RGB image I a
function [E] = imenergy(I)
%Because I is a color image, first convert I to double using im2double, 
I = im2double(I);
%and then to grayscale using rgb2gray before computing the gradient magnitude. 
J = double(rgb2gray(I));
%You can use the MATLAB function Gmag = imgradient(J) to compute the gradient magnitude matrix
%(of type double) of a grayscale image J.
[Gmag, Gdir] = imgradient(J);
E = Gmag;
end

