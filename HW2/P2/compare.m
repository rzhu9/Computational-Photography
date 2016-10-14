function [ J ] = compare( I,L )
%compareImg This function takes in two RGB image and calculate the squared 
%difference and return it

I = im2double(I);
L = im2double(L);
J = zeros(size(I,1),size(I,2));

% Get each channel separately
R1 = I(:,:,1);
R2 = L(:,:,1);
G1 = I(:,:,2);
G2 = L(:,:,2);
B1 = I(:,:,3);
B2 = L(:,:,3);

%calculating the squared diffferecne of each channel and add together.
for i = 1:size(I,1)
    for j = 1:size(I,2)
        J(i,j) = (R1(i,j)-R2(i,j)).^2 + (G1(i,j)-G2(i,j)).^2 +(B1(i,j)-B2(i,j)).^2 ;
    end
end


J = im2uint8(J);

end