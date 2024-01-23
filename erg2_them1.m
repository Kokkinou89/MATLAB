##install pkg -forge statistics
pkg load statistics

clc;
clear;

n = dlmread('data.txt');

figure(1);
[W, pc] = princomp(n');
plot(pc(1,1:10),pc(2,1:10),'ro')
hold on;
plot(pc(1,11:20),pc(2,11:20),'bo')
grid on;
legend('Gastric Cancer','Normal')
title('First and Second Principal Components for Cases with Gastric Cancer and without it after PCA')
hold off;

[U, S, V] = svd(n);
singular_values = [];
for i = 1:20
  singular_values = [singular_values; S(i,i)];
endfor

figure(2);
overall_contribution = 0;
for i = 1:20
  overall_contribution = overall_contribution + singular_values(i);
endfor

fractions = [];
for i =1:20
  fraction_of_overall_contribution = singular_values(i) / overall_contribution;
  fractions = [fractions;fraction_of_overall_contribution];
endfor

b = bar(fractions);
grid on;
xlabel('Singular Values of n Matrix')
title('Contribution(%) of Singular Values to the Sum of all Singular Values')

for i = 1:rows(S)
  for j = 1:columns(S)
    if i >2
      S(i,j) = 0;
    endif
  endfor
endfor

nSVD = U*S*V';

squared_s_v = singular_values.^2;
sum = 0;
for i = 1:20
  sum = sum + squared_s_v(i);
endfor
percent_of_loss = 0;
for i = 3:20
  f = squared_s_v(i)/sum;
  percent_of_loss = percent_of_loss + f;
endfor
percent_of_loss

figure(3);
[W, pc1] = princomp(nSVD');
plot(pc1(1:10,1),pc1(1:10,2),'ro')
hold on;
plot(pc1(11:20,1),pc1(11:20,2),'bo')
legend('Gastric Cancer','Normal')
grid on;
title('First and Second Principal Components for PCA of nSVD')
hold off;
