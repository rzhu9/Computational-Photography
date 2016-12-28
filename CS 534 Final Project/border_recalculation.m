function [ b_new ] = border_recalculation...
  (s,g_ave,g_cov ,b,I)
% g_ave is 3*1 matrix, g_cov is 3*3, s is [n*3]
cnt = 0;
[H W D] = size(I);
% find true sky 
comp = find_true_sky(s,g_ave); %[n*3 , rgb] % need to change!
% [X Y] = meshgrid(1,1:size(s,1));
s_true = s(comp,:) % every row is a pixel [n*3]
s_true = s_true'; %[3*n]
% s_false = s(~comp,:);
% s_false = s_false';
% figure
% scatter3(s_true(1,:),s_true(2,:),s_true(3,:))
% hold on
% scatter3(s_false(1,:),s_false(2,:),s_false(3,:))
% legend('s_true','s_false')

[cov_s_true strue_ave] = Cal_covariance(s_true);
for x=  1:W
    for y =1:b(x)
        % for sky
        cell = [I(y,x,1);I(y,x,2);I(y,x,3)]; %[3*1]
        dist_s= (cell-strue_ave)'* (inv(cov_s_true))*(cell-strue_ave);
        % for ground
        dist_g= (cell-g_ave)'* (inv(g_cov)) * (cell-g_ave);  % change here     
        if dist_s < dist_g
            cnt= cnt+1;
        end 
    end 
    if cnt < b(x)/2
        b_new(x) = 0;
    else
        b_new(x)=b(x);
    end     
end 

end

function comp = find_true_sky(s,g_centroid)
% s is [n*3] matrix, columns represent r,g,b
[idx centroid] = kmeans(s,2);
% compare centroids
c1 = centroid(1);
c2 = centroid(2);
dist_c1_g = sqrt(sum((c1-g_centroid).^2));
dist_c2_g = sqrt(sum((c2-g_centroid).^2));
if dist_c1_g <= dist_c2_g
    comp = idx==2;
else
    comp = idx==1;
end 

end

