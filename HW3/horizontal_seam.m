%Implement a function S = horizontal_seam(I) that takes an image and finds the (one)
%optimal horizontal seam, returning a vector of length equal to the number of columns in I
%such that each entry in vector S is an integer-valued row number indicating which pixel in
%that column should be removed. 
function [S] = horizontal_seam(I)
[rows, cols] = size(I);

%create a hashMap with same size as input I
%an entry in hashMap represents the minimum total cost to reach that spot
hashMap = zeros(rows, cols);
%initialize the first column of the hashMap since we start from the first column
hashMap(:, 1) = I(:, 1);

for j = 2:cols
    %special case: first row
    hashMap(1, j) = min(hashMap(1:2, j-1)) + I(1, j);
    %special case: last row
    hashMap(rows, j) = min(hashMap(rows-1:rows, j-1)) + I(rows, j);
    for i = 2:(rows-1)
        hashMap(i, j) = min(hashMap(i-1:i+1, j-1)) + I(i, j);
    end
end

%b2 = imagesc(hashMap);
%saveas(b2, 'zhu.2b.jpg');

%find the index of the minimum value in the last column
%assign that index in the last spot of the return variable S 
[magitude, rowIndex] = min(hashMap(:, cols));
S(cols) = rowIndex;

for j=1:cols-1
    %special case: first row
    if rowIndex == 1
        [magitude, i] = min(hashMap(rowIndex:rowIndex+1, cols-j));
        rowIndex = rowIndex + i - 1;
    %special case: last row
    elseif rowIndex == rows
        [magitude, i] = min(hashMap(rowIndex-1:rowIndex, cols-j));
        rowIndex = uint8(rowIndex + i - 2);
    else    
        [magitude, i] = min(hashMap(rowIndex-1:rowIndex+1, cols-j));
        rowIndex = uint8(rowIndex + i - 2);
    end
    %assign value to S from end to the front (back track)
    S(cols-j) = rowIndex;
end


end

