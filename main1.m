close all;

Tau1 = [0 1.5 2.9 3.78 4.8 8];
Tau  = [0 1.5 2.9 3   4.8 8];
% Y = [0 1.799223754405984 3.335675559241787 3.393980791257826 5.205051574640142 5.261650516528526];
A = [-1 0 0 0 0 0 ;1 -1 0 0 0 0;0 1 -1 0  0 0;0 0 1 -1 0 0; 0 0 0 1 -1 0;0 0 0 0 1 -1];
b = [0;0;0;0;0;0];
Aeq = [1 0 0 0 0 0];
beq = [0];
options = optimset('MaxFunEvals',10000);
% options=optimset('display','iter');
[Y,fval] = fmincon(@f_celu, Tau1,A,b,Aeq,beq,[],[],[],options);


przedzialy_rys(Y);
% przedzialy_rys(Tau1);

