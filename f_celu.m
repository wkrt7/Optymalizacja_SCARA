function [Q]=f_celu(Tau)
    close all
    Tau
    x_last = przedzialy(Tau);
    x_zad=[0 0 0 0];
    ro=100;
    d = x_last - x_zad
    Q = Tau(end)+0.5*ro*d*d';

end