function [ x_last ] = przedzialy( Tau )
%PRZEDZIALY Summary of this function goes here
%   Detailed explanation goes here
    u=[-1 1;
        -1 -1;
        1 -1 ;
        1 1 ;
        0 0;
        0 0];
    x =[1.6 -.5 0 0];
    MSH = 100;
	global tmp
	tmp=1;
    for i = 1:(length(Tau) - 1)
		delta = Tau(i+1) - Tau(i);
		n = ceil(MSH * delta);
		h = delta/n;
        [x,x_all,czas,u_all] = rk4(x,u(i,:),n,h);  
    end;
    x_last = x;
end
