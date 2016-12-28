
function J = colorfilter(A,w,sigma_d,sigma_r)

% convert to CIELab
A = rgb2lab(A);

SIZE = size(A);
J = zeros(SIZE);

% Guassian domain weights
[X,Y] = meshgrid(-w:w,-w:w);
G = exp(-(X.^2+Y.^2)/(2*sigma_d^2));

% rescale to get maximum intensity value
sigma_r = 100*sigma_r;

% waitbar to see the progress
% h = waitbar(0,'Bilateral filter');
% set(h,'Name','Progress');


for i = 1:SIZE(1)
   for j = 1:SIZE(2)
       
         % local value
         imin = max(i-w,1);
         imax = min(i+w,SIZE(1));
         jmin = max(j-w,1);
         jmax = min(j+w,SIZE(2));
         I = A(imin:imax,jmin:jmax,:);

         % Gaussian range weights
         dL = I(:,:,1)-A(i,j,1);
         da = I(:,:,2)-A(i,j,2);
         db = I(:,:,3)-A(i,j,3);
         H = exp(-(dL.^2+da.^2+db.^2)/(2*sigma_r^2));
      
       
         tmp = H.*G((imin:imax)-i+w+1,(jmin:jmax)-j+w+1);
         norm_tmp = sum(tmp(:));
         J(i,j,1) = sum(sum(tmp.*I(:,:,1)))/norm_tmp;
         J(i,j,2) = sum(sum(tmp.*I(:,:,2)))/norm_tmp;
         J(i,j,3) = sum(sum(tmp.*I(:,:,3)))/norm_tmp;
                
   end
   %waitbar(i/SIZE(1));
end

bilateral = lab2rgb(J);

brighten = imadjust(bilateral, [0 0.8],[0 1]);
brighten = round(brighten.^(0.7),5);
%sharpen edges
boxfilter = [0, 1/5, 0; 1/5,1/5,1/5;0,1/5,0];
tmp = imfilter(brighten, boxfilter);
Lapcian = [0,1,0;1,-4,1;0,1,0];
img = tmp -2*(imfilter(tmp,Lapcian));

r = img(:,:,1);
g = img(:,:,2);
b = img(:,:,3);
blue = max(b-max(r,g),0);
green = max(g-max(b,r),0);
red = max(r-max(b,g),0);
b_mod = min(b+1.5*blue,1);
g_mod = min(g+1.5*green,1);
r_mod = min(r+1.5*red,1);
img(:,:,2) = g_mod;
img(:,:,3) = b_mod;
img(:,:,1) = r_mod;

J = img;