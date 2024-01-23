clc;
clear;

S = [12 4 6 4; 16 12 2 3; 0 4 10 12; 4 12 21 3];

CLN = [ 50 50 50 50; 50 50 50 50; 50 50 50 50; 50 50 50 50];

for a = 1: 12
  for i = 1: 4
    for j = 1: 4
       if(S(i,j)< 5) 
        CLN(i,j) = CLN(i,j) - 0.5 * S(i,j);
       elseif(S(i,j) >= 5)
        CLN(i,j) = CLN(i,j) + 0.5* S(i,j);
       elseif(CLN(i,j) - 0.5* S(i,j) < 0)
         CLN(i,j) = 0;
       endif     
     endfor
   endfor
   for g = 1:4
     for k = 1:4
        if(S(g,k) - 2 < 0)
          S(g,k)  = 0;
        elseif(S(g,k) - 2 >=0)
          S(g,k) = S(g,k) - 2;
        endif 
     endfor
   endfor 
if(a ==4)
S
CLN  
elseif(a ==8)
S
CLN
elseif(a ==12)
S
CLN
endif
endfor  