function [ J ] = mydemosaic( I )
imgInput = im2double(I);
J = zeros(size(imgInput,1),size(imgInput,2),3);
%Define three channels
R_Channel = zeros(size(imgInput,1),size(imgInput,2));
G_Channel = zeros(size(imgInput,1),size(imgInput,2));
B_Channel = zeros(size(imgInput,1),size(imgInput,2));
%initialize three channel with known values
size(imgInput)
size(R_Channel)
R_Channel(1:2:end,1:2:end) = imgInput(1:2:end,1:2:end, 1);
G_Channel(2:2:end,1:2:end) = imgInput(2:2:end,1:2:end, 2);
G_Channel(1:2:end,2:2:end) = imgInput(1:2:end,2:2:end, 2);
B_Channel(2:2:end,2:2:end) = imgInput(2:2:end,2:2:end, 3);
%Compute Filters
%RB_Filter = [0.25,0.5,0.25;0.5,1,0.5;0.25,0.5,0.25];
%G_Filter = [0,0.25,0;0.25,1,0.25;0,0.25,0];
R_Filter = [0.3,0.4,0.8;0.3,0.5,0.8;0.3,0.4,0.8];
B_Filter = [0.2,0.5,0.2;0.2,0.5,0.2;0.2,0.5,0.2];
G_Filter = [0.2,0.2,0.2;0.2,0.2,0.2;0.2,0.2,0.2];
%filtering the channel with corresponding filter
R = imfilter(R_Channel,R_Filter);
G = imfilter(G_Channel,G_Filter);
B = imfilter(B_Channel, B_Filter);

J(:,:,1) = R;
J(:,:,2) = G;
J(:,:,3) = B;

end