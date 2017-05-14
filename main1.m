close all;

Tau1 = [0 1.5 2.9 3.8 4.8 8];
Tau = [0 1.5 2.9 3 4.8 8];
A = [-1 0 0 0 0 0 ;1 -1 0 0 0 0;0 1 -1 0  0 0;0 0 1 -1 0 0; 0 0 0 1 -1 0;0 0 0 0 1 -1];
b = [0;0;0;0;0;0];
Aeq = [1 0 0 0 0 0]
beq = [0]
options = optimset('MaxFunEvals',2000);
[Y,fval] = fmincon(@f_celu, Tau,A,b,Aeq,beq,[],[],[],options)

przedzialy_rys(Y);
przedzialy_rys(Tau1)

