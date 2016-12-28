function [ b_opt ] = border_opt( thresh_min,thresh_max,n,I)
% grad is a gradient image 
% initialization
b_opt = 0;
b_tmp=0;
J_max = 0;
gamma= 2; 
grad = imgradient(rgb2gray(I));
% J = zeros(n,1);
for k = 1:n
    t= thresh_min+(thresh_max-thresh_min)/(n-1)*(k-1);
    b_tmp = getBorder(grad,t);
    J_t = energy(I,b_tmp);
  
%     imshow(grad>t)
%     hold on
%     plot(b_tmp)
%     title(num2str(J_t))
%     hold off
%     J(k) = J_t;
    if J_t>J_max
        J_max = J_t;
        b_opt = b_tmp;
    
    end 
end
% figure
% plot(J);
end

