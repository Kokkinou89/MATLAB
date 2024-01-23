% 1st experiment

v0 = [-60];
t = linspace (0, 300, 201);
v = lsode ("f71", v0, t); 
plot(t, v);
title('evolution of voltage');
xlabel('Time');
ylabel('membrane voltage');
axis([0 200 -130 -50]);
hold;


% 2nd experiment

v0 = [-125];
v = lsode ("f71", v0, t); 
plot(t, v);


% 3rd experiment

v0 = [-75];
v = lsode ("f71", v0, t); 
plot(t, v);
hold;
