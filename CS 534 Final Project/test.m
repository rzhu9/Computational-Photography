%%

I = imread('test1.jpg');

[H, W, D] = size(I);
I = im2double(I);
% I = imgradient(rgb2gray(I));
% imshow(I)

b_opt=  skyBorder(I);
figure
subplot(2,1,1)
imshow(I)
subplot(2,1,2)
imshow(seperate_sky(I,b_opt))
hold on
plot(b_opt)

% log = seperate_sky(I,b_opt);
%  I_R=I(:,:,1);
%     I_G=I(:,:,2);
%     I_B = I(:,:,3);
%     % sky
%     s_R = I_R(log)';
%     s_G = I_G(log)';
%     s_B = I_B(log)';
%      g_R = I_R(~log)';
%     g_G = I_G(~log)';
%     g_B = I_B(~log)';
%     figure
%  scatter3(s_R,s_G,s_B)
%  hold on
%  scatter3(g_R,g_G,g_B)





% I_R=I(:,:,1);
% I_G=I(:,:,2);
% I_B = I(:,:,3);
% grad= imgradient(rgb2gray(I));
% h = getBorder(grad,1);
% plot(h)

% b_opt = border_opt(5,600,120,I);

% b_opt = 0;
% b_tmp=0;
% J_max = 0;
% gamma= 2; % experimentally according to the paper!
% grad = imgradient(rgb2gray(I));
% thresh_min = 5;
% thresh_max = 600;
% n = 120;
% for k=1:n
%   t= thresh_min+(thresh_max-thresh_min)/(n-1)*(k-1);
%     b_tmp = getBorder(grad,t);
%     log = seperate_sky(I,b_tmp);
%     I_R=I(:,:,1);
%     I_G=I(:,:,2);
%     I_B = I(:,:,3);
%     % sky
%     s_R = I_R(log)';
%     s_G = I_G(log)';
%     s_B = I_B(log)';
%     s = [s_R;s_G;s_B];
%     [s_cov, s_ave] = Cal_covariance(s);
%     egv_s= eig(s_cov);
% 
%  g_R = I_R(~log)';
%     g_G = I_G(~log)';
%     g_B = I_B(~log)';
%     g =[g_R;g_G;g_B];
%     [g_cov,g_ave]= Cal_covariance(g);
%     egv_g = eig(g_cov);
%      J_t= 1/(gamma* det(s_cov)+det(g_cov)+gamma*det(egv_s(1))+det(egv_g(1)));
%     
%     if J_t>J_max
%     J_max = J_t;
%     b_opt = b_tmp;
%     end 
% 
% end 
% hold on
% imshow(I)
% plot(b_opt,[0 284], [0 490])
% 
% %border_ave = mean(b_opt);
% % since the images will have sky, we skip the steps testing if sky exists
% 
% % test if there is a special case
% diff_abs = zeros(1,size(b,2)-1);
% for x = 1: W-1
%     diff_abs(x) = abs(b(x+1)-b(x))
% end
% 
% if sum(diff_abs(x) > (H/3))>0 % some cols have spikes exist
%     % border recalculation
%     log = seperate_sky(I,b_opt);
%     sr = I_R(log)';
%     sg = I_G(log)';
%     sb = I_B(log)';
%     s = [sr;sg;sb]'; %[n*3]
%     gr = I_R(~log)';
%     gg = I_G(~log)';
%     gb = I_B(~log)';
%     g = [gr;gg;gb];  %[3*n]
%     [g_cov,g_ave]= Cal_covariance(g);
%     b_new = border_recalculation(s,g_ave,g_cov,b_opt,I);
% else
%     b_new = b_opt;
% end

