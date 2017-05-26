function [ x_last ] = przedzialy_rys( Tau )
%PRZEDZIALY Summary of this function goes here
%   Detailed explanation goes here
    u=[-1  1;
       -1 -1;
        1 -1;
        1  1;
        0  0;
        0  0];
    x =[1.5 -.5 0 0];
    MSH = 100;
    x_all = [];
    czas = [];
    u_all = [];
    for i = 1:(length(Tau) - 1)
		delta = Tau(i+1) - Tau(i);
		n = ceil(MSH * delta);
		h = delta/n;
        [x,x_all_t,czas_t,u_all_t] = rk4(x,u(i,:),n,h,Tau(i));  
        x_all = cat(2,x_all,x_all_t);
        u_all = cat(2,u_all,u_all_t);
        czas = cat(2,czas,czas_t);
        
    end;
    figure(1)
    title('cz³on 1')

    subplot(3,1,1)
    plot(czas,x_all(1,:))
    grid on
    xlabel('czas [s]')
    ylabel(' po³o¿enie cz³onu 1')

    subplot(3,1,2)
    plot(czas,x_all(3,:),'g')
    grid on
    xlabel('czas [s]')
    ylabel(' prêdkoœæ cz³onu 1')

    subplot(3,1,3)
    plot(czas,u_all(1,:),'r')
    xlabel('czas [s]')
    ylabel(' sterowanie cz³onu 1')
    grid on


    figure(2)
    title('cz³on 2')

    subplot(3,1,1)
    plot(czas,x_all(2,:))
    grid on
    xlabel('czas [s]')
    ylabel(' po³o¿enie cz³onu 2')

    subplot(3,1,2)
    plot(czas,x_all(4,:),'g')
    grid on
    xlabel('czas [s]')
    ylabel(' prêdkoœæ cz³onu 2')

    subplot(3,1,3)
    plot(czas,u_all(2,:),'r')
    xlabel('czas [s]')
    ylabel(' sterowanie cz³onu 2')
    grid on
        
        
        
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
        plot(x_1(end),y_1(end),'r*')
        plot(x_1(1),y_1(1),'g*')
        legend('trajeltoria systemu','punkt koñcowy','punkt pocz¹tkowy')
        axis([-2 2 -2 2])
        xlabel('x1')
        ylabel('x2')
    
    x_last = x;
end
