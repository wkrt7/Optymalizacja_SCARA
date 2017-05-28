function [Q]=f_celu(Tau)
    x_last = przedzialy(Tau);
    x_zad = [0 0 0 0];
    ro=200;
    d = x_last - x_zad;
    Q = Tau(end)+0.5*ro*d*d';

end