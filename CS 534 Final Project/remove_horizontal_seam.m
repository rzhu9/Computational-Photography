function J = remove_horizontal_seam(I, S)
[rows, cols, height] = size(I);
J = zeros(rows-1, cols, 3);
for j=1:cols
    bound = S(j);
    bound2 = bound +1;
    bound3 = bound -1;
    J(1:bound3, j, :) = I(1:bound3, j, :);
    J(bound:rows-1, j, :) = I(bound2:rows, j, :);   
end


%K = zeros(rows, cols, 3);
%for j=1:cols
    %bound = S(j);
    %K(1:bound-1, j, :) = I(1:bound-1, j, :);
    %K(bound+1:rows, j, :) = I(bound+1:rows, j, :);   
%end
%imwrite(K, 'zhu.3.jpg');


%end