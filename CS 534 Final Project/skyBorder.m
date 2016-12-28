function [ b_new ] = skyBorder( I )
%reshape read 2d kmeans, inv matrix inverse, meshgrid(column, row); logical
%array
% convert to grayscale !
[H, W, D] = size(I);
I_R=I(:,:,1);
I_G=I(:,:,2);
I_B = I(:,:,3);
thresh_min = 1/1443*5;
thresh_max = 1/1443*600;
b = border_opt(thresh_min,thresh_max,120,I);

% since the images will have sky, we skip the steps testing if sky exists

% test if there is a special case
diff_abs = zeros(1,size(b,2)-1);
for x = 1: W-1
    diff_abs(x) = abs(b(x+1)-b(x));
end

if any(diff_abs > (H/4)) % some cols have spikes exist
    % border recalculation
    log = seperate_sky(I,b);
    sr = I_R(log)';
    sg = I_G(log)';
    sb = I_B(log)';
    s = [sr;sg;sb]'; %[n*3]
    gr = I_R(~log)';
    gg = I_G(~log)';
    gb = I_B(~log)';
    g = [gr;gg;gb];  %[3*n]
    [g_cov,g_ave]= Cal_covariance(g);
    b_new = border_recalculation(s,g_ave,g_cov,b,I);
else
    b_new = b;
end


end


