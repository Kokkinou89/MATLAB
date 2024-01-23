clc;
clear;
function dm = fex2(p,t)
  
 global K1= 1;
 global K2 = 1;
 global K3 = 1;
 global K4 = 1;
 global KI = 1;
 global Km1 = 0.5;
 global Kd = 0.2; 
 global n = 4;
 global us = 0.76;
 global um = 0.65;
 global ud = 0.95;
 global ks = 0.38;
 global k1 = 1.9;
 global k2 = 1.3;
 global V1 = 3.2;
 global V2 = 1.58;
 global V3 = 5;
 global V4 = 2.5;
 
  dm = zeros(5,1);
  dm(1) = us *( KI^n/( KI^n + (p(5)) ^n)) - um * (p(1)/(Km1 +p(1)));
  dm(2) = (ks * p(1)) - V1 * (p(2)/(K1 +p(2))) + V2 * (p(3) / (K2 +p(3)));
  dm(3) = V1 * (p(2) / (K1 + p(2)))- V2 * (p(3)/ (K2 + p(3))) - V3 *(p(3)/(K3 + p(3))) + V4 * (p(4)/ (K4 +p(4)));
  dm(4) = V3* (p(3) / (K3+ p(3))) - V4 * ( p(4) / (K4 + p(4)))- (k1*p(4)) + (k2 *p(5)) - ud *( p(4)/ (Kd+p(4)));
  dm(5) = (k1*p(4)) - (k2 * p(5));
  
  endfunction