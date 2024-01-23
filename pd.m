% 1st experiment
s0 = [0; 0];
t = linspace (0, 1.5, 151);
s = lsode ("f", s0, t);
figure(1);
plot(t, s);
title('evolution of consentration');
xlabel('Time');
ylabel('concentration');
axis([0 1.5 0 2]);
legend('s1', 's2');
figure(2);
plot(s(:,1),s(:,2));
title('phase diagram');
xlabel('s1');
ylabel('s2');
axis([0 2 0 2]);
hold;
% 2nd experiment
s0 = [0.5; 0.5];
s = lsode ("f", s0, t);
figure(3);
plot(t, s);
title('evolution of consentration');
xlabel('Time');
ylabel('concentration');
2
axis([0 1.5 0 2]);
legend('s1', 's2');
figure(2);
plot(s(:,1),s(:,2));
title('phase diagram');
xlabel('s1');
ylabel('s2');
axis([0 2 0 2]);
% 3rd experiment
s0 = [0.2; 1];
s = lsode ("f", s0, t);
figure(4);
plot(t, s);
title('evolution of consentration');
xlabel('Time');
ylabel('concentration');
axis([0 1.5 0 2]);
legend('s1', 's2');
figure(2);
plot(s(:,1),s(:,2));
title('phase diagram');
xlabel('s1');
ylabel('s2');
axis([0 2 0 2]);
legend('1st exp', '2nd exp', '3rd exp');
hold;