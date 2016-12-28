function [difference] = color_similation(source, target)
source_row = size(source, 1);
source_col = size(source, 2);
target_row = size(target, 1);
target_col = size(target, 2);
row = min(source_row, target_row);
col = min(source_col, target_col);
row_difference = abs(source_row - row);
col_difference = abs(source_col - col);
resize_source = shrnk(source, row_difference, col_difference);
row_difference = abs(target_row - row);
col_difference = abs(target_col - col);
resize_target = shrnk(target, row_difference, col_difference);

 I = imread('background/8.jpg');
 I  = im2double(I);
end
