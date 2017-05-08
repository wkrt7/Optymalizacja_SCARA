close all;

Tau = [0 1.5 3 4 5.5];

% Y = fmincon(@f_celu, Tau, [-1 0 0 0 0 ;1 -1 0 0 0;0 -1 1 0 0; 0 0 1 -1 0; 0 0 0 -1 1],[0;0;0;0;0]);
f_celu(Tau);
hold off;