function vdot = f71 (v, t)

      vdot = zeros (1,1);
      
      C = 0.98;
      g = 0.0144;
      E = -93.6;
            
      vdot(1) = g/C*(E - v(1));
      
endfunction