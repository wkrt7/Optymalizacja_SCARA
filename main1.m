close all;

Tau = [0 1.5 2.9 3.8 4.8 8];

% Y = fmincon(@f_celu, Tau, [-1 0 0 0 0 ;1 -1 0 0 0;0 -1 1 0 0; 0 0 1 -1 0; 0 0 0 -1 1],[0;0;0;0;0]);
f_celu(Tau);
hold off;