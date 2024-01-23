pkg load statistics

clc;
clear;

data = dlmread('data.txt');
figure(1);
[W, pc] = princomp(data');
plot3(pc(1,1:10),pc(2,1:10),pc(3,1:10),'ro')
hold on;
plot3(pc(1,11:20),pc(2,11:20),pc(3,11:20),'bo')
grid on;
legend('Gastric Cancer','Normal')
title('First, Second and Third Principal Components for Twenty Cases')
hold off;

pc = pc';
new_data = [];
for i = 1:3
  new_data = [new_data; pc(i,:)];
endfor

k = 2;
[idx, centers] = kmeans (new_data', k);

figure(2);
x = [];
y = [];
z = [];
for i = 1:10
  if idx(i) == 1
    x = [x; new_data(1,i)];
    y = [y; new_data(2,i)];
    z = [z; new_data(3,i)];
  endif
endfor
plot3(x,y,z,'g*','DisplayName','Cases with Gastric Cancer in First Cluster')
hold on;
x = [];
y = [];
z = []; 
for i = 1:10
  if idx(i) == 2
    x = [x; new_data(1,i)];
    y = [y; new_data(2,i)];
    z = [z; new_data(3,i)];
  endif
endfor
plot3(x,y,z,'r*','DisplayName','Cases with Gastric Cancer in Second Cluster')
hold on;
x = [];
y = [];
z = []; 
for i = 11:20
  if idx(i) == 1
    x = [x; new_data(1,i)];
    y = [y; new_data(2,i)];
    z = [z; new_data(3,i)];
  endif
endfor
plot3(x,y,z,'ro','DisplayName','Normal Cases in First Cluster')
hold on;
x = [];
y = [];
z = [];
for i = 11:20
  if idx(i) == 2
    x = [x; new_data(1,i)];
    y = [y; new_data(2,i)];
    z = [z; new_data(3,i)];
  endif
endfor
plot3(x,y,z,'go','DisplayName','Normal Cases in Second Cluster')
legend('show');
grid on;
title('First, Second and Third Principal Components of Sample with K-means Clustering')
hold off;