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


%---------------------display------------------------------------
% figure(1);
% title('1')
% plot(czas,Y(1,:),'r')
% hold on;
% plot(czas,U_temp(1,:),'g')
% legend('x1','u1')
% figure(2);
% title('2')
% 
% plot(czas,Y(2,:),'b')
% hold on;
% plot(czas,U_temp(2,:),'g')
% legend('x2','u2')

% -------------------proste zadanie kinematyki------------------------
% a1 = 1;
% a2 = 0.7;
% x = a1 * cos(Y(1,:)) + a2 * cos(Y(1,:)+ Y(2,:));
% y = a1 * sin(Y(1,:)) + a2 * sin(Y(1,:)+ Y(2,:));
% figure;
% plot(x,y)
% axis([-2 2 -2 2])
end

