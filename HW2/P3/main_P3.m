clc;clear;close all;

source = imread('P3-source.jpg');
target = imread('P3-target.jpg');

out = mycolortransfer(source,target);
out = lab2rgb(out);
imwrite(out,'P3-out.jpg');
clc;clear;close all;

source = imread('P3-mysource.jpg');
target = imread('P3-mytarget.jpg');
out = mycolortransfer(source,target);
out = lab2rgb(out);
imwrite(out,'P3-myout.jpg');
clc;clear;close all;