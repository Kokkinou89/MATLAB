# N(t)= ( N0 e^rt ) / ( K + N0 (e^rt-1) )
N0 = 2.0
K = 1.0
r = 0.1
t = linspace(0,5,200)

N = ( N0 * K * exp(r*t) ) ./ ( K + N0 * (exp(r*t)-1) );
plot(t, N, 'g');
hold on;

r2 = 1.5;
N2 = ( N0 * K * exp(r2*t) ) ./ ( K + N0 * (exp(r2*t)-1) );
plot(t, N2, 'b');
 
r3 = 10.0;
N3 = ( N0 * K * exp(r3*t) ) ./ ( K + N0 * (exp(r3*t)-1) );
plot(t, N3, 'r');

hold off;

#Extras on plot
title('Χρονική εξέλιξη πληθυσμού που ακολουθεί Λογιστικό μοντέλο');
xlabel('t');
ylabel('population');
grid on;