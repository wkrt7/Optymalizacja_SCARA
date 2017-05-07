function [ X_prim ] = rhs(X,U)
%SCARA Summary of this function goes here
%   Detailed explanation goes here

    I1=1;
    I2=1;
    m1=10;
    m2=5;
    d1=1;
    d2=0.7;
    xc1=0.5;
    xc2=0.35;
    yc1=0;
    yc2=0;
    s1=0.1;
    s2=0.1;
    f1=0.01;
    f2=0.01;
    x1 = X(1); 
    x2 = X(2);
    x3 = X(3);
    x4 = X(4);
    u1 = U(1);
    u2 = U(2);
    kf = 50;
    
    B = m2*d1*(xc2*cos(x2)-yc2*sin(x2));

    M11 = I1+I2+m2*d1^2+2*B;
    M12 = B;
    M21 = M12;
    M22 = I2;
    Bx2 = -m2*d1*(xc2*sin(x2)+yc2*(cos(x2)));
    V1 = Bx2 *(2*x3*x4+x4^2);
    V2 = -Bx2 * x3^2;
    T1=s1*tanh(kf*x3)+f1*x3;
    T2=s2*tanh(kf*x4)+f2*x4;
    M_new = [M11,M12;M21,M22];
    M = M_new^(-1);
    f0=[x3;x4;-M(1,1)*(V1+T1)-M(1,2)*(V2+T2);-M(1,2)*(V1+T1)-M(2,2)*(V2+T2)];
    g1=[0;0;M(1,1);M(1,2)];
    g2=[0;0;M(1,2);M(2,2)];

    X_prim=f0+u1*g1+u2*g2();
end

