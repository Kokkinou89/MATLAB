clear;

t = linspace( 0, 50, 501 );

p0 = [0.1; 0.25; 0.25; 0.25; 0.25];
p01 = [1.9; 0.8; 0.8; 0.8; 0.8];

p = lsode ( "fex2", p0, t);
figure (1);
plot(t,p(:,2));
hold on;
plot(t,p(:,3));
hold on;
plot(t,p(:,4));
hold on;
plot(t,p(:,5));
hold on;
plot(t,p(:,2)+ p(:,3)+ p(:,4)+ p(:,5));
hold off;
legend('p0','p1','p2','pN','pT');
xlabel('time');
ylabel('concentration');
title('Behavior of Goldbeter oscillator');


figure(2);
plot(t,p(:, 1));
hold on;
plot(t,p(:, 5));
hold on;
plot(t, p(:,2)+p(:,3)+p(:,4)+p(:,5));
hold off;
legend('m', 'pN', 'pT');
xlabel('time');
ylabel('concentration');
title('Graph of mRNA,PER,PT');

figure (3);
plot3(p(:,1), p(:,5),p(:,2)+p(:,3)+p(:,4)+p(:,5) );
hold off;
xlabel('m');
ylabel('PN');
zlabel('PT');
title('3D Graph of mRNA(m),PER in the nucleus(PN),PER(PT) ');

hold off;
grid on;


p = lsode ( "fex2", p01, t);
figure (4);
plot(t,p(:,2));
hold on;
plot(t,p(:,3));
hold on;
plot(t,p(:,4));
hold on;
plot(t,p(:,5));
hold on;
plot(t,p(:,2)+ p(:,3)+ p(:,4)+ p(:,5));
hold off;
legend('p0','p1','p2','pN','pT');
xlabel('time');
ylabel('concentration');
title('Behavior of Goldbeter oscillator');


figure(5);
plot(t,p(:, 1));
hold on;
plot(t,p(:, 5));
hold on;
plot(t, p(:,2)+p(:,3)+p(:,4)+p(:,5));
hold off;
legend('m', 'pN', 'pT');
xlabel('time');
ylabel('concentration');
title('Graph of mRNA,PER,PT');

figure (6);
plot3(p(:,1), p(:,5),p(:,2)+p(:,3)+p(:,4)+p(:,5) );
hold off;
xlabel('m');
ylabel('pN');
zlabel('pT');
title('3D Graph of mRNA(m),PER in the nucleus(PN),PER(PT) ');

hold off;
grid on;



