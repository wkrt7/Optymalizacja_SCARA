close all;
clear all

Tau1 = [0 1.5 2.9 3.78 4.8 8];
Tau  = [0 1.5 2.9 3   4.8 8];
Y =[ 0.0000    1.7951    3.2397    3.4308    5.1931    5.3695];  % rozwi¹zanie
A = [-1 0 0 0 0 0 ;1 -1 0 0 0 0;0 1 -1 0  0 0;0 0 1 -1 0 0; 0 0 0 1 -1 0;0 0 0 0 1 -1];
b = [0;0;0;0;0;0];
Aeq = [1 0 0 0 0 0];
beq = [0];
options=optimset('display','iter','MaxFunEvals',10000);
[Y,fval] = fmincon(@f_celu, Tau1,A,b,Aeq,beq,[],[],[],options);
Y

przedzialy_rys(Y);

