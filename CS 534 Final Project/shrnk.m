function [J] = shrnk(I, num_rows_removed, num_cols_removed)
if num_cols_removed > 0
    for i = 1:num_rows_removed
        E = imenergy(I);
        S  = horizontal_seam(E);
        I = remove_horizontal_seam(I,S);
    end
end

if num_cols_removed > 0
    I = permute(I, [2 1 3]);
    for i = 1:num_cols_removed
        E = imenergy(I);
        S  = horizontal_seam(E);
        I = remove_horizontal_seam(I,S);
    end
    I = permute(I, [2 1 3]);
end
J = I;
end

