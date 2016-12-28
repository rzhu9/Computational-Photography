function [ im_blended ] = blend( im_input1, im_input2 )
%BLEND Blends two images together via feathering
% Pre-conditions:
%     `im_input1` and `im_input2` are both RGB images of the same size
%     and data type
% Post-conditions:
%     `im_blended` has the same size and data type as the input images
    
    assert(all(size(im_input1) == size(im_input2)));
    assert(size(im_input1, 3) == 3);

    im_blended = zeros(size(im_input1), 'like', im_input1);
    %------------- YOUR CODE STARTS HERE -----------------
    im_alpha1 = rgb2alpha(im_input1);
    im_alpha2 = rgb2alpha(im_input2);
    IR1 = im_input1(:, :, 1);
    IR2 = im_input2(:, :, 1);
    IG1 = im_input1(:, :, 2);
    IG2 = im_input2(:, :, 2);
    IB1 = im_input1(:, :, 3);
    IB2 = im_input2(:, :, 3);
    IRout = (im_alpha1.*IR1 + im_alpha2.*IR2)./(im_alpha1 + im_alpha2);
    IGout = (im_alpha1.*IG1 + im_alpha2.*IG2)./(im_alpha1 + im_alpha2);
    IBout = (im_alpha1.*IB1 + im_alpha2.*IB2)./(im_alpha1 + im_alpha2);
    im_blended(:, :, 1) = IRout;
    im_blended(:, :, 2) = IGout;
    im_blended(:, :, 3) = IBout;
    %------------- YOUR CODE ENDS HERE -----------------

end

function im_alpha = rgb2alpha(im_input, epsilon)
% Returns the alpha channel of an RGB image.
% Pre-conditions:
%     im_input is an RGB image.
% Post-conditions:
%     im_alpha has the same size as im_input. Its intensity is between
%     epsilon and 1, inclusive.

    if nargin < 2
        epsilon = 0.001;
    end
    
    %------------- YOUR CODE STARTS HERE -----------------
    tmp = zeros(size(im_input, 1), size(im_input, 2));
    BW = tmp == im_input(:, :, 1);
    dis = bwdist(BW);
    im_alpha = epsilon + (1-epsilon)*(dis./max(dis(:)));
    %imwrite(im_alpha, 'alpha.jpg')
%     row = size(im_input, 1);
%     col = size(im_input, 2);
%     im_alpha = zeros(row-2, col-2);
%     BW  = zeros(row + 2,col + 2);
%     for i = 1:col + 2
%        BW(1, i) = 1; 
%        BW(row + 2, i) = 1;
%     end
%     for i = 1:row + 2
%        BW(i, 1) = 1;
%        BW(i, col + 2) = 1;
%     end
%     %BWrow = size(BW, 1)
%     %BWcol = size(BW, 2)
%     tmp = bwdist(BW);
%     %tmprow = size(tmp, 1)
%     %tmpcol = size(tmp, 2)
%     for i = 2:(size(tmp, 1)-1)
%         for j = 2:(size(tmp, 2)-1)
%             im_alpha(i-1, j-1) = tmp(i, j);
%         end
%     end
%     M = max(im_alpha(:));
%     for i = 1:size(im_alpha, 1)
%         for j = 1:size(im_alpha, 2)
%             im_alpha(i, j) = im_alpha(i, j)/M;
%             if (im_alpha(i, j) == 0)
%                 im_alpha(i, j) = epsilon;
%             end
%         end
%     end
     %alpharow = size(im_alpha, 1)
     %alphacol = size(im_alpha, 2)
    %------------- YOUR CODE ENDS HERE -----------------
end
