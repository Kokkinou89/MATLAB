# N(t)= ( N0 e^rt ) / ( K + N0 (e^rt-1) )
N0 = 0.2
K = 1
r = 1
t = linspace(0,5,200)

N = ( N0 * K * exp(r*t) ) ./ ( K + N0 * (exp(r*t)-1) );
plot(t, N, 'g');
hold on;

N02 = 1.5;
N2 = ( N02 * K * exp(r*t) ) ./ ( K + N02 * (exp(r*t)-1) );
plot(t, N2, 'b');
 
N03 = 2.8;
N3 = ( N03 * K * exp(r*t)) ./ ( K+ N03 * (exp(r*t)-1));
plot(t, N3, 'r');

hold off;

#Extras on plot
title('Χρονική εξέλιξη πληθυσμού που ακολουθεί Λογιστικό μοντέλο');
xlabel('t');
ylabel('population');
grid on;