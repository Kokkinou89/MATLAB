function sdot = f (s, t)
 sdot = zeros (2,1);

 k1 = 20;
 k2 = 5;
 k3 = 5;
 k4 = 5;
 k5 = 2;
 n = 4;
 K = 1;

 sdot(1) = k1/(1 + (s(2)/K).^n) - (k3 + k5)*s(1);
 sdot(2) = k2 + k5*s(1) - k4*s(2);

endfunction