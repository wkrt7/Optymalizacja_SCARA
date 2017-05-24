function [ x_last,x_all,czas,u_all ] = rk4( x_first,u,n,h )
%RK4 Summary of this function goes here
% n = ceil(MSH*delta)
%   Detailed explanation goes here
yj = x_first;
global tmp;
    for j = 1 : n
      k1 = h*rhs(yj,u);
      k2 = h*rhs(yj+k1'/2,u);
      k3 = h*rhs(yj+k2'/2,u);
      k4 = h*rhs(yj+k3',u);
      yj = yj + (k1' + 2*k2' + 2*k3' + k4')/6;
      % for displaying
	  tmp = tmp + 1;
      czas(j) = tmp;
	  Y(:,j) = yj;
      U_temp(:,j) = u;

    end
x_last = Y(:,end)';
x_all = Y;
u_all = U_temp;



end

