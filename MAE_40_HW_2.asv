% Bennett Manalo, PID:A16473204
clear, close all, syms s Vi Vs C L R R1 R2 Rb Rc Ca C1 C2 C3 Cd Ii Ir Ic2 Ic3 Ir4  Vm  Vo R4 Cb Ra Rd Cc Cb
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%                               Question 1 (See HW submission for part A)
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%                                 Part B
%-------------------------------------------------------------------------
%x =    {I0     Ia    Ib     Ic    Id    V1    V2}                         <-- unknown vector
A  =    [ 0     Ra     0     0     0     1     0;                          %V0=-IaRa+V1
          0      0     1     0     0     0     Cb*s;                       %Vo=(-Ib/Cb*s)+v2
          0      0     0     1     0   Cc*s   -Cc*s;                       %Cc*s*(V1-V2)-Ic
          0      0     0     0    Rd     0     -1;                         %0=Id*Rd+v2
         -1      1     1     0     0     0     0;                          %0=Ia+Ib-Io
          0      0    -1     1     1     0     0;                          %0=Ic+Ib-Io
          0      1     0     1     0     0     0;]                         %0=-Ic+Ia
b  =    [ Vo; Cb*s*Vo; 0;    0;    0;    0;    0];                         
x=A\b;                                                                     %Ax = b, solve for unknown values of x
x
Voutput=simplify(x(7));                                                    
Vinput=-1*simplify(x(4))+simplify(x(6));                                   
Transfer_Function1B=simplify((Voutput)/(Vinput))                           %produces transfer function per the ratio Vo/Vi

%-------------------------------------------------------------------------
%                                 Part C                               
%-------------------------------------------------------------------------
%Given Assumptions as per the question
Ra = 2*R;
Cb = C;
Cc = C;
Rd = R/2;
%x =    {I0     Ia    Ib     Ic    Id    V1    V2}                         <-- unknown vector
A  =    [ 0     Ra     0     0     0     1     0;                          %V0=-IaRa+V1
          0      0     1     0     0     0     Cb*s;                       %Vo=(-Ib/Cb*s)+v2
          0      0     0     1     0   Cc*s   -Cc*s;                       %Cc*s*(V1-V2)-Ic
          0      0     0     0    Rd     0     -1;                         %0=Id*Rd+v2
         -1      1     1     0     0     0     0;                          %0=Ia+Ib-Io
          0      0    -1     1     1     0     0;                          %0=Ic+Ib-Io
          0      1     0     1     0     0     0;]                         %0=-Ic+Ia
b  =    [ Vo; Cb*s*Vo; 0;    0;    0;    0;    0];  
x=A\b;                                                                     %Ax = b, solve for unknown values of x
x
Voutput=simplify(x(6));
Vinput=Vo;                    
Transfer_Function1C=simplify((Voutput)/(Vinput))                           %produces transfer function per the ratio Vo/Vi
omega=10; 
F1=RR_tf([1 omega omega^2],[1 3*omega omega^2]);                           %Graphs BODE plot
figure(1), RR_bode(F1) 

%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%                               Question 2 (See HW submission for part A)
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%                                 Part B
%-------------------------------------------------------------------------
%x =    {I0     Ia     Ib     Ic    Id    V1    V2}                        <-- unknown vector
A  =    [ 0  1/(Ca*s)   0      0      0     1     0;                       %Vo=V1-(Ia/Ca*s)
          0      0     -Rb     0      0     0     1;                       %Vo=-Ib*Rb+v2
          0      0      0      Rc     0    -1     1;                       %0=IcRc-V1+V2
          0      0      0      0      1     0    Cd*s;                     %0=Cd*s*V2+Id
         -1      1      1      0      0     0     0;                       %0=Ia+Ib-Io         
          0      0     -1      1      1     0     0;                       %0=Ic+Ib-Io
          0     -1      0      1      0     0     0;]                      %0=-Ic+Ia
b  =    [ Vo;   Vo;     0;     0;    0;    0;    0];
x=A\b;                                                                     %Ax = b, solve for unknown values of x
x
Voutput=simplify(x(7));
Vinput=-1*simplify(x(4))+simplify(x(6));                    
Transfer_Function2B=simplify((Voutput)/(Vinput))                           %produces transfer function per the ratio Vo/Vi

%-------------------------------------------------------------------------
%                                 Part C                               
%-------------------------------------------------------------------------
Ca = C/2;                                                                  %Given Assumptions as per the question
Rb = R;
Rc = R;
Cd = 2*C;
%x =    {I0     Ia     Ib     Ic     Id    V1    V2}                       <-- unknown vector
A  =    [ 0  1/(Ca*s)   0      0      0     1     0;                       %Vo=V1-(Ia/Ca*s)
          0      0     -Rb     0      0     0     1;                       %Vo=-Ib*Rb+v2
          0      0      0      Rc     0    -1     1;                       %0=IcRc-V1+V2
          0      0      0      0      1     0    Cd*s;                     %0=Cd*s*V2+Id
         -1      1      1      0      0     0     0;                       %0=Ia+Ib-Io         
          0      0     -1      1      1     0     0;                       %0=Ic+Ib-Io
          0     -1      0      1      0     0     0;]                      %0=-Ic+Ia
b  =    [ Vo;   Vo;     0;     0;     0;    0;    0];                      
x=A\b;                                                                     %Ax = b, solve for unknown values of x
x0=
Voutput=simplify(x(6));
Vinput=Vo;                    
Transfer_Function2C=simplify((Voutput)/(Vinput))                           %produces transfer function per the ratio Vo/Vi
omega=10; 
F2=RR_tf([1 omega omega^2],[1 3*omega omega^2]);                           %Graphs BODE plot
figure(2), RR_bode(F2) 