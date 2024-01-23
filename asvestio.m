Cax = linspace(0, 1 , 100);
Cay = linspace(0, 1 , 100); 
K1 = 5.88;
K2 = 0.0625;
KI = 0.022;
Prot1T = 0.01;
Prot2T = 0.01;

d1 = (Prot2T .* Cax.^2) ./ ((K2 + Cax.^2) .* (1 + (Cax.^2/KI)));
d2 = (Prot1T .* Cay.^4) ./ (K1 + Cay.^4);

plot(Cax, d1);
hold on; 
plot(Cay, d2);
hold off;

xlabel('Ca2+ [\muM]');
ylabel('active protein [\muM]');
legend('Prot2' , 'Prot1');
title ('Binding curves of the two proteins');


