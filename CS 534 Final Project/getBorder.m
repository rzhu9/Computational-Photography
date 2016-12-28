function [b] = getBorder(grad,t )
% grad is a gradient image!
% grad is a double, t is a integer
[H,W] = size(grad);
for x=1:W
   b(x) = H;
    for y=1:H
        if grad(y,x)> t 
            b(x) = y;
            break;
        end 
    end 
end 
end

