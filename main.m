function [  ] = main(Tau, U, x0  )
close all;
%MAIN Summary of this function goes here
%   Detailed explanation goes here
%U = [u_max, u_min, u_max]; 
MSH = 100;
Y = zeros(4,ceil(MSH * Tau(end)));
U_temp = zeros(2,ceil(MSH * Tau(end)));
 % krokow/s
yj = x0;
l = 1;

% for Tau = 1 t = 0
% pierwsza wspo³rzêdna Tau odpoiwada t = 0
for i = 1 : length(Tau) - 1 
    delta = Tau(i+1) - Tau(i);
    n = ceil(MSH * delta);
    h = delta/n;
    u = U(i,:);
    for j = 1 : n
      figure(1);
      plot(l,u(1),'ro')
      hold on
      figure(2);
      plot(l,u(2),'b*')
      hold on
      U_temp(:,(i-1)*n  + j) = u;
      k1 = h*scara(yj,u);
      k2 = h*scara(yj+k1'/2,u);
      k3 = h*scara(yj+k2'/2,u);
      k4 = h*scara(yj+k3',u);
      yj = yj + (k1' + 2*k2' + 2*k3' + k4')/6;
      Y(:,l) = yj;
      l = l +1 ;
    end
end
a1 = 1;
a2 = 0.7;
% proste zadanie kinematyki
x = a1 * cos(Y(1,:)) + a2 * cos(Y(1,:)+ Y(2,:));
y = a1 * sin(Y(1,:)) + a2 * sin(Y(1,:)+ Y(2,:));
% odwrtone zadanie kinematyki
% theta2 = acos((x.^2 + y.^2 - a1^2 - a2^2)/(2*a1*a2));
% theta1 = asin(a2*sin(theta2)/(sqrt(x.^2 +y.^2))) + arctan((y/x));

figure(1);
plot(Y(1,:),'r')
hold on;
% plot(theta1,'b')
% plot(U_temp(1,:),'g')
figure(2);
plot(Y(2,:),'b')
hold on;
% plot(U_temp(2,:),'g')
figure;
plot(x,y)
axis([-2 2 -2 2])




