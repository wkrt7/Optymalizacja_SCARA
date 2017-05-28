close all;
clear all
Tau1 = [1.5 2.9 3.78 4.8 8];
Tau1 = [.1 2.5 3.9 4 5];

% Y =[ 1.9642    2.9795    3.6950    5.3733    5.3734];  % rozwi¹zanie
A = [-1 0 0 0 0  ;1 -1 0 0 0 ;0 1 -1 0  0 ;0 0 1 -1 0 ; 0  0 0 1 -1;];
b = [0;0;0;0;0];
Aeq = [];
beq = [];
options=optimset('display','iter','MaxFunEvals',10000);
[Y,fval] = fmincon(@f_celu, Tau1,A,b,Aeq,beq,[],[],[],options);
Y

przedzialy_rys(Y);

