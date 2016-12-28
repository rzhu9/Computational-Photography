function H = calcHWithRANSAC(p1, p2)
% Returns the homography that maps p2 to p1 under RANSAC.
% Pre-conditions:
%     Both p1 and p2 are nx2 matrices where each row is a feature point.
%     p1(i, :) corresponds to p2(i, :) for i = 1, 2, ..., n
%     n >= 4
% Post-conditions:
%     Returns H, a 3 x 3 homography matrix

    assert(all(size(p1) == size(p2)));  % input matrices are of equal size
    assert(size(p1, 2) == 2);  % input matrices each have two columns
    assert(size(p1, 1) >= 4);  % input matrices each have at least 4 rows

    %------------- YOUR CODE STARTS HERE -----------------
    % 
    % The following code computes a homography matrix using all feature points
    % of p1 and p2. Modify it to compute a homography matrix using the inliers
    % of p1 and p2 as determined by RANSAC.
    %
    % Your implementation should use the helper function calcH in two
    % places - 1) finding the homography between four point-pairs within
    % the RANSAC loop, and 2) finding the homography between the inliers
    % after the RANSAC loop.
    
    %size(p1, 1)
    %size(p1, 2)
    %size(p2, 1)
    %size(p2, 2)
    maxDist = 3;
    maxCount = 0;
    Hstar = zeros(3, 3);
    for numIter = 1:100
        % select four pairs of points randomly from those computed by SIFT
        n = size(p1, 1);
        inds = randperm(n, 4);
        % compute H from these four pairs of points, and 
        % then count how many of the other pairs of points agree,
        p1random = zeros(4, 2);
        p2random = zeros(4, 2);
        p1random(1, 1) = p1(inds(1), 1);
        p1random(1, 2) = p1(inds(1), 2);
        p1random(2, 1) = p1(inds(2), 1);
        p1random(2, 2) = p1(inds(2), 2);
        p1random(3, 1) = p1(inds(3), 1);
        p1random(3, 2) = p1(inds(3), 2);
        p1random(4, 1) = p1(inds(4), 1);
        p1random(4, 2) = p1(inds(4), 2);
        p2random(1, 1) = p2(inds(1), 1);
        p2random(1, 2) = p2(inds(1), 2);
        p2random(2, 1) = p2(inds(2), 1);
        p2random(2, 2) = p2(inds(2), 2);
        p2random(3, 1) = p2(inds(3), 1);
        p2random(3, 2) = p2(inds(3), 2);
        p2random(4, 1) = p2(inds(4), 1);
        p2random(4, 2) = p2(inds(4), 2);
        Htmp = calcH(p1random, p2random);
        count = 0;
        for index = 1:size(p1, 1)
           tmp = [p1(index, 1); p1(index, 2); 1];
           tmp2 = [p2(index, 1); p2(index, 2); 1];
           q1 = Htmp * tmp2;
           dist = sqrt(sum((q1 - tmp)).^2); 
           if (dist < maxDist)
                count  = count + 1;
           end
        end
        if (count > maxCount)
            maxCount = count;
            Hstar = Htmp;
        end
    end
    p1agree = [];
    p2agree = [];
    index2 = 1;
    for index = 1:size(p1, 1)
        tmp = [p1(index, 1); p1(index, 2); 1];
        tmp2 = [p2(index, 1); p2(index, 2); 1];
        q1 = Hstar * tmp2;
        dist = sqrt(sum((q1 - tmp)).^2); 
        if (dist < maxDist)
           p1agree(index2, 1) = p1(index, 1);
           p1agree(index2, 2) = p1(index, 2);
           p2agree(index2, 1) = p2(index, 1);
           p2agree(index2, 2) = p2(index, 2);
           index2 = index2 + 1;
        end
    end
    H = calcH(p1agree, p2agree);
    %------------- YOUR CODE ENDS HERE -----------------
end

% The following function has been implemented for you.
% DO NOT MODIFY THE FOLLOWING FUNCTION
function H = calcH(p1, p2)
% Returns the homography that maps p2 to p1 in the least squares sense
% Pre-conditions:
%     Both p1 and p2 are nx2 matrices where each row is a feature point.
%     p1(i, :) corresponds to p2(i, :) for i = 1, 2, ..., n
%     n >= 4
% Post-conditions:
%     Returns H, a 3 x 3 homography matrix
    
    assert(all(size(p1) == size(p2)));
    assert(size(p1, 2) == 2);
    
    n = size(p1, 1);
    if n < 4
        error('Not enough points');
    end
    H = zeros(3, 3);  % Homography matrix to be returned

    A = zeros(n*3,9);
    b = zeros(n*3,1);
    for i=1:n
        A(3*(i-1)+1,1:3) = [p2(i,:),1];
        A(3*(i-1)+2,4:6) = [p2(i,:),1];
        A(3*(i-1)+3,7:9) = [p2(i,:),1];
        b(3*(i-1)+1:3*(i-1)+3) = [p1(i,:),1];
    end
    x = (A\b)';
    H = [x(1:3); x(4:6); x(7:9)];

end
