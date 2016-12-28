function log = seperate_sky(I,b)
H = size(I,1);
W = size(I,2);

[X Y] = meshgrid([1:W],[1:H]);
[Xb]= meshgrid(b,[1:H]);
log= Y<=Xb;
end

