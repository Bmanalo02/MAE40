% Bennett Manalo, PID:A16473204
clear, close all, syms s Vi Vs C L R R1 R2 C1 Cd
%-------------------------------------------------------------------------
%                               Question 1
%-------------------------------------------------------------------------
%x =    {I_L, Icap Ires  Vo}                                                <-- unknown vector
A  =    [-1    1    1    0;                                                 % -I_L + Ic + Ir= 0
         -L*s  0    0    1;                                                 %  dV = l * d(I)/dt
          0   -1    0   C*s;                                                %  Ic = C * d(V0)/dt
          0    0    R   -1;]                                                %  V0 = Ir*R
b  =    [ 0;  Vi;   0;   0]; 
x=A\b;                                                                      %  Ax = b, solve for unknown values of x
x
Vo_LPF2_damped=simplify(x(4));                                              % x(4) is Vo
Vi_LPF2_damped=L*s*(simplify(x(1)))+(Vo_LPF2_damped);                       % Solve for Vi given solved x
Omega42=(1/sqrt(L*C));
Transfer_Function=simplify((Omega42*Vo_LPF2_damped)/(Omega42*Vi_LPF2_damped))         % Given G(s)=Vo/Vi, solve for transfer function
%-------------------------------------------------------------------------
%                               Question 2
%-------------------------------------------------------------------------
omega4=10; 
zeta=[0.1 0.7 1];
F_LPF2_damped1=RR_tf([omega4^2],[1 2*zeta(1)*omega4 omega4^2]);             %zeta = 0.1
figure(1), RR_bode(F_LPF2_damped1)                                          %plots figure 1
F_LPF2_damped2=RR_tf([omega4^2],[1 2*zeta(2)*omega4 omega4^2]);             %zeta = 0.7
figure(2), RR_bode(F_LPF2_damped2)                                          %plots figure 2
F_LPF2_damped3=RR_tf([omega4^2],[1 2*zeta(3)*omega4 omega4^2]);             %zeta = 1
figure(3), RR_bode(F_LPF2_damped3)                                          %plots figure 3  
%-------------------------------------------------------------------------
%                               Question 3
%-------------------------------------------------------------------------
% x=      {IL IC1 IC2  IR   Vo  Vint}  <-- unknown vector
A  =      [-1   1   1   0    0   0;                                         %IL+IC1+IR=0 
            0   0   1  -1    0   0;                                         %IC2-IR=0
          -L*s  0   0   0    1   0;                                         %V0-VI-L(IC)S=0
            0   1   0   0  -C1*s  0;                                         %IC1*S-C*V0*S=0
            0   0   1   0    0  -Cd*s;                                         %IC2*S-C*VINT*S=0
            0   0   0   R   -1   1;]                                        %IR*R+VINT-VO=0
b =       [ 0;  0;  Vi; 0;   0;  0];                                        
x=A\b;                                                                      %  Ax = b, solve for unknown values of x
x 
Vo_LPF2_damped=simplify(x(5));                                              % x(4) is Vo
Vi_LPF2_damped=-1*L*s*(simplify(x(1)))+(Vo_LPF2_damped);                       % Solve for Vi given solved x
Transfer_Function=simplify((Vo_LPF2_damped)/(Vi_LPF2_damped))         % Given G(s)=Vo/Vi, solve for transfer function
%-------------------------------------------------------------------------
%                               Question 4
%-------------------------------------------------------------------------
Cd=4*C1;                                                                   %given relations from Q4
R=sqrt(L/C1);                                                              %given relations from Q4
A  =      [-1   1   1   0    0   0;                                        
            0   0   1  -1    0   0;                                        
          -L*s  0   0   0    1   0;                                         
            0   1   0   0  -C1*s 0;                                        
            0   0   1   0    0 -Cd*s;                                      
            0   0   0   R   -1   1;]                                        
b =       [ 0;  0;  Vi; 0;   0;  0];                                        
x=A\b;                                                                      %  Copied and pasted from Q3
x 
Vo_LPF2_damped=simplify(x(5));                                              
Vi_LPF2_damped=-1*L*s*(simplify(x(1)))+(Vo_LPF2_damped);                      
Transfer_Function=simplify((Vo_LPF2_damped)/(Vi_LPF2_damped))