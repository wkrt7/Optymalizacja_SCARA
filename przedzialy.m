function [ x_last ] = przedzialy( Tau )
    u=[-1  1; 
       -1 -1;
        1 -1;
        1  1;
        0  0;
        0 0];
    x =[1.5 -.5 0 0];  % Punkt pocz¹tkowy
    Tau = [0 Tau];
    MSH = 100;
    for i = 1:(length(Tau) - 1)
		delta = Tau(i+1) - Tau(i);
		n = ceil(MSH * delta);
		h = delta/n;
      
        [x,x_all,czas,u_all] = rk4(x,u(i,:),n,h,0);  
    end;
    x_last = x;
end
