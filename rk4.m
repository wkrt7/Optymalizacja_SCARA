function [ x_last,x_all,czas,u_all ] = rk4( x_first,u,n,h,t0 )
%RK4 Summary of this function goes here
% n = ceil(MSH*delta)
%   Detailed explanation goes here
yj = x_first;
Y = zeros(length(yj),n);
U_temp = zeros(length(u),n);

    for j = 1 : n
      k1 = rhs(yj,u);
      k2 = rhs(yj+h*k1'/2,u);
      k3 = rhs(yj+h*k2'/2,u);
      k4 = rhs(yj+h*k3',u);
      yj = yj + (k1' + 2*k2' + 2*k3' + k4')*h/6;
      % for displaying
	  Y(:,j) = yj;
      U_temp(:,j) = u;
    end
czas = linspace(t0,t0+n*h,n);

x_last = Y(:,end)';
x_all = Y;
u_all = U_temp;



end

