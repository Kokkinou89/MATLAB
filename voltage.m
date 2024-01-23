E = -93.6;
g = 0.0144;
C = 0.98;
V0 = -50;

t = linspace(500,1000, 900);

V = E .- (exp((-1*((g/C)).*t)).*(E - V0));

plot( t, V);

hold on;
V01 = -120;

t1 = linspace(1000, 1500, 900);
V1 = E .-(exp((-1*((g/C)).*t)).*(E- V01));

plot(t1,V1);
hold on;

V02 = -20;

t2 = linspace (1500, 2000,900);
V2= E.-(exp((-1*((g/C)) .*t)) .* (E-V02));

plot(t2,V2);

hold off;

ylabel('Membrane voltage');
xlabel('Time');