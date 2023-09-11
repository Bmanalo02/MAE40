syms s Vo1 Vi V m Vo Voa Vob Vd C L R Ic Il Ila Ilb Ir t Vo3
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%                               Question 1 (Part C and D)
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------
%                               Phase 1
%-------------------------------------------------------------------------
%x = [Vo    Vm     Il     Ic   Ir   ]
A1  =[ 0     s      0     0    0     ;                                     % Vi = Vm*s
       0     -1     L*s   0    0     ;                                     % Ila*L = L*(s*Il)  - Vm
      C*s    0      0     -1   0     ;                                     % C*Voa = C*(s*Vo) - Ic 
      -1     0      0     0    R     ;                                     % 0 = Ir*R - Vo
       0     0      0     1    1    ];                                     % 0 = Ir + Ic     
b1  =[ Vi ; Ila*L; C*Voa; 0;   0    ]; 
x1 = A1\b1;
Vo1_s = x1(1);                                                             % Vo in terms of variable s
I1_s = x1(3);                                                              % I1 in terms of variable s
Vo1_t = simplify(ilaplace(Vo1_s))                                          % Vo in terms of time
I1_t = simplify(ilaplace(I1_s))                                            % I1 in terms of time

%-------------------------------------------------------------------------
%                               Phase 2
%-------------------------------------------------------------------------
%x = [Vo   Vm   Il    Ic  Ir   ]
A2  =[ s   -s    0    0   0     ;                                          % Vd = (Vo*s) - (Vm*s)
       0   -1   L*s   0   0     ;                                          % L*Ila = L*(s*Il)  - Vm
      C*s   0    0   -1   0     ;                                          % C*Voa = C*(s*Vo) - Ic 
      -1    0    0    0   R     ;                                          % 0 = Ir*R - Vo
       0    0    1    1   1    ];                                          % 0 = Ir + Ic + Il
b2=[ Vd;L*Ila; C*Voa; 0;  0    ]; 
x2=A2\b2;
Vo2_s = x2(1);                                                             % Vo in terms of variable s
I2_s = x2(3);                                                              % I2 in terms of variable s
Vo2_t = simplify(ilaplace(Vo2_s))                                          % Vo in terms of time
I2_t = simplify(ilaplace(I2_s))                                            % I2 in terms of time

%-------------------------------------------------------------------------
%                               Phase 3
%-------------------------------------------------------------------------
%x = [   Vo   Vm  Il  Ic    Ir   ]
A3 = [    0   -1  L*s  0    0     ;                                        % L*Ilb = L*s*Il - Vm
          0    0   0   1    1     ;                                        % 0 = Ic + Ir
         -1    0   0   0    R     ;                                        % 0 = Ir*R - Vo  
          0    0   1   1    1     ;                                        % 0 = Ir + Ic + Il
         C*s   0   0  -1    0    ];                                        % C*Vob = C*s*Vo - Ic      
b3  =[ L*Ilb; 0;  0;  0; C*Vob]; 
x3 = A3\b3;
Vo3_s = x3(1);                                                             % Vo in terms of variable s
I3_s = x3(3);                                                              % I3 in terms of variable s
Vo3_t = simplify(ilaplace(Vo3_s))                                          % Vo in terms of time
I3_t = simplify(ilaplace(I3_s))                                            % I3 in terms of time
%-------------------------------------------------------------------------
%                               Phase 4
%-------------------------------------------------------------------------
%x = [  Vo    Vm    Il   Ic   Ir   ]
A4 = [  0    -1    L*s    0   0     ;                                      % L*Il_B = L*s*Il - Vm 
       C*s    0     0    -1   0     ;                                      % C*Vo_B = C*s*Vo - Ic
       -1     0     0     0   R     ;                                      % 0 =Ir*R - Vo   
        s    -s     0     0   0     ;                                      % Vd = Vo*s - Vm*s
        0     0     1     1   1    ];                                      % 0 = Il + Ic + Ir     
b4=[ L*Ilb; C*Vob;  0;   Vd;  0    ]; 
x4=A4\b4; 
Vo4_s = x4(1);                                                             % Vo in terms of variable s
I4_s = x4(3);                                                              % I4 in terms of variable s
Vo4_t = simplify(ilaplace(Vo4_s))                                          % Vo in terms of time
I4_t = simplify(ilaplace(I4_s))                                            % I4 in terms of time
