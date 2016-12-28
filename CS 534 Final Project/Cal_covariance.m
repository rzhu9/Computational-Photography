function [cov_matrix,s_ave] = Cal_covariance(s)
% s is the region [3*n]

s_ave = mean(s,2); % [3*1] matrix
temp = 0;
N = size(s,2);
for x=1:N
    diff= s(:,x) - s_ave;
    temp= temp + diff*diff';   % temp is [3*3]matrix
end
cov_matrix= 1/N*temp;
end


