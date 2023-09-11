syms C s R C1 Vi L

%Part C
%omega=10; 
%Fig=RR_tf([(1/Q)omega],[1 (1/Q)omega omega^2]);                           %Graphs BODE plot
%figure, RR_bode(Fig) 

%Part D%-------------------------------------------------------------------------
%                               Question 1 (Part C and D)
%-------------------------------------------------------------------------
%x =      {Vo   Vm    Ii   IR   IRL}
A  =      [ 0    1    L*s   0    0;                                        
          -C*s  C*s  -1    0    0;                                         
           -1    0    0    R    0;                                         
           -1    0    0    0   R/C1;                                       
            0    0   -1    1    1;]                                        %See notes for matrix derivision
b =       [Vi;   0;   0;   0;   0];                                        
x=A\b;                                                                     %Ax = b, solve for unknown values of x
x 
Voutput=simplify(x(1));
Vinput=Vi;                    
Transfer_Function=simplify((Voutput)/(Vinput)) 
