clear;

t = linspace( 0, 90, 501 );

p0 = [ 1.8; 0.6; 0.6; 0.6; 0.6];

 global K1;
 global K2; 
 global K3;
 global K4;
 global KI;
 global Km1;
 global Kd;  
 global n; 
 global us; 
 global um;
 global ud; 
 global ks; 
 global k1; 
 global k2; 
 global V1; 
 global V2; 
 global V3;
 global V4;
 
 
 K1 = 1;
 K2 = 1;
 K3 = 1;
 K4 = 1;
 KI = 1;
 Km1 = 1;
 Kd = 0.2;
 n = 1;
 us = 0.76;
 um = 0.65;
 ud = 2.7;
 ks = 0.38;
 k1 = 1.9;
 k2 = 1.3;
 V1 = 3.2;
 V2 = 1.58;
 V3 = 5;
 V4 = 2.5;
 


p1 = lsode ( "fm3", p0, t);
figure (1);
plot(t,p1(:,2));
hold on;
plot(t,p1(:,3));
hold on;
plot(t,p1(:,4));
hold on;
plot(t,p1(:,5));
hold on;
plot(t,p1(:,2)+ p1(:,3)+ p1(:,4)+ p1(:,5));
hold off;
legend('p0','p1','p2','pN','pT');
xlabel('time');
ylabel('concentration');
title('Behavior of Goldbeter oscillator');


figure(2);
plot(t,p1(:, 1));
hold on;
plot(t,p1(:, 5));
hold on;
plot(t, p1(:,2)+p1(:,3)+p1(:,4)+p1(:,5));
hold off;
legend('m', 'pN', 'pT');
xlabel('time');
ylabel('concentration');
title('Graph of mRNA,PER,PT');

figure (3);
plot3(p1(:,1), p1(:,5),p1(:,2)+p1(:,3)+p1(:,4)+p1(:,5) );
hold off;
xlabel('m');
ylabel('PN');
zlabel('PT');
title('3D Graph of mRNA(m),PER in the nucleus(PN),PER(PT) ');

hold off;
grid on;


