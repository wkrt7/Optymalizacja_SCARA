function [ x_last ] = przedzialy( Tau )
%PRZEDZIALY Summary of this function goes here
%   Detailed explanation goes here
    u=[-1 1;-1  1; 1 -1;1 1 ; 0 0 ; 0 0];
%     u=[1 0;1  0; 1 0;1 0 ; 0 0 ];
%     u=[0 1;  0 1;0 1 ;0 1 ; 0 1 ];
    x =[1.5 -.5 0 0];
    MSH = 100;
	global tmp
	tmp=1;
	for i = 1:(length(Tau) - 1)
		delta = Tau(i+1) - Tau(i);
		n = ceil(MSH * delta);
		h = delta/n;
        [x,x_all,czas,u_all] = rk4(x,u(i,:),n,h);  
%         figure(1)
%         title('x_1')
%         plot(czas,x_all(1,:))
%         hold on
%         plot(czas,u_all(1,:))
%         figure(2)
%         title('x_2')
%         plot(czas,x_all(2,:))
%         hold on
%         plot(czas,u_all(2,:))
%         figure(3)
%         title('proste zadanie kinematyki')
%         a1 = 1;
%         a2 = 0.7;
%         x_1 = a1 * cos(x_all(1,:)) + a2 * cos(x_all(1,:)+ x_all(2,:));
%         y_1 = a1 * sin(x_all(1,:)) + a2 * sin(x_all(1,:)+ x_all(2,:));
%         plot(x_1,y_1)
%         axis([-2 2 -2 2])

    end;
    x_last = x;
end
