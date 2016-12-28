function [ J_t ] = energy( I, b )
%seperate sky and ground by border and calculate the energy value given
% a t-value 
    log = seperate_sky(I,b);
    I_R=I(:,:,1);
    I_G=I(:,:,2);
    I_B = I(:,:,3);
    % sky
    s_R = I_R(log)';
    s_G = I_G(log)';
    s_B = I_B(log)';
    s = [s_R;s_G;s_B];
    [s_cov, s_ave] = Cal_covariance(s);
    egv_s= eig(s_cov);
    % ground
    g_R = I_R(~log)';
    g_G = I_G(~log)';
    g_B = I_B(~log)';
    g =[g_R;g_G;g_B];
    [g_cov,g_ave]= Cal_covariance(g);
    egv_g = eig(g_cov);
    J_t= 1/(det(s_cov)+det(g_cov)+sum(egv_s)^2+sum(egv_g)^2);

end

