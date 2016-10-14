function [ K ] = mycolortransfer(I, J)
source = rgb2lab(I);
target = rgb2lab(J);

source_L = source(:,:,1);
source_A = source(:,:,2);
source_B = source(:,:,3); 

target_L = target(:,:,1);
target_A = target(:,:,2);
target_B = target(:,:,3); 

mean_L_target = mean2(target_L);
mean_A_target = mean2(target_A);
mean_B_target = mean2(target_B);

stddev_L_source = std2(source_L);
stddev_A_source = std2(source_A);
stddev_B_source = std2(source_B);

stddev_L_target = std2(target_L);
stddev_A_target = std2(target_A);
stddev_B_target = std2(target_B);

out_L = (stddev_L_target/stddev_L_source)*(source_L - mean2(source_L)) + mean_L_target;
out_A = (stddev_A_target/stddev_A_source)*(source_A - mean2(source_A)) + mean_A_target;
out_B = (stddev_B_target/stddev_B_source)*(source_B - mean2(source_B)) + mean_B_target;

K(:,:,1) = out_L; 
K(:,:,2) = out_A; 
K(:,:,3) = out_B;


end

