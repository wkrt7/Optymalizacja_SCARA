function [ x_last ] = przedzialy( Tau )
%PRZEDZIALY Summary of this function goes here
%   Detailed explanation goes here
    u=[-1 1;
       -1 -1;
        1 -1 ;
        1 1 ;
        0 0;
        0 0];
%     u=[1 0;1  0; 1 0;1 0 ; 0 0 ];
%     u=[0 1;  0 1;0 1 ;0 1 ; 0 1 ];
    x =[1.5 -.5 0 0];
    MSH = 100;
	global tmp
	tmp=1;
    x_all = [];
    czas = [];
    u_all = [];
    for i = 1:(length(Tau) - 1)
		delta = Tau(i+1) - Tau(i);
		n = ceil(MSH * delta);
		h = delta/n;
        [x,x_all_t,czas_t,u_all_t] = rk4(x,u(i,:),n,h);  
        x_all = cat(2,x_all,x_all_t);
        u_all = cat(2,u_all,u_all_t);
        czas = cat(2,czas,czas_t);
        
    end;
    figure(1)
        title('x_1')
        plot(czas/MSH,x_all(1,:))
        hold on
        plot(czas/MSH,x_all(3,:),'g')
        hold on
        plot(czas/MSH,u_all(1,:),'r')
        hold on
        grid on
        legend('x1','x3','u1')
        figure(2)
        
        title('x_2')
        plot(czas/MSH,x_all(2,:))
        hold on
        plot(czas/MSH,x_all(4,:),'g')
        hold on
        grid on
        plot(czas/MSH,u_all(2,:),'r')
        legend('x2','x4','u2')
        
%----------------------display proste zadanie kinematyki-------
        figure(3)
        title('proste zadanie kinematyki')
        a1 = 1;
        a2 = 0.7;
        x_1 = a1 * cos(x_all(1,:)) + a2 * cos(x_all(1,:)+ x_all(2,:));
        y_1 = a1 * sin(x_all(1,:)) + a2 * sin(x_all(1,:)+ x_all(2,:));
        plot(x_1,y_1)
        hold on
        grid on
        axis([-2 2 -2 2])
    
    x_last = x;
end
