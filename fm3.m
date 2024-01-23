clc;
clear;
function dm = fm3(p,t)
  
 global K1
 global K2 
 global K3
 global K4 
 global KI 
 global Km1 
 global Kd  
 global n 
 global us 
 global um 
 global ud 
 global ks 
 global k1 
 global k2 
 global V1 
 global V2 
 global V3
 global V4 
 
  dm = zeros(5,1);
  dm(1) = us *( KI^n/( KI^n + (p(5)) ^n)) - um * (p(1)/(Km1 +p(1)));
  dm(2) = (ks * p(1)) - V1 * (p(2)/(K1 +p(2))) + V2 * (p(3) / (K2 +p(3)));
  dm(3) = V1 * (p(2) / (K1 + p(2)))- V2 * (p(3)/ (K2 + p(3))) - V3 *(p(3)/(K3 + p(3))) + V4 * (p(4)/ (K4 +p(4)));
  dm(4) = V3* (p(3) / (K3+ p(3))) - V4 * ( p(4) / (K4 + p(4)))- (k1*p(4)) + (k2 *p(5)) - ud *( p(4)/ (Kd+p(4)));
  dm(5) = (k1*p(4)) - (k2 * p(5));
  
  endfunction