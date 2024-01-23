pkg load statistics
clc;
clear;

n = dlmread('data.txt');

[W pc]= princomp(n');

figure(1);
plot(pc(1,1:10), pc(2,1:10), 'ro');
hold on;
plot(pc(1,11:20), pc(2,11:20),'bo');
hold off;

[U S V] = svd(n);

singular_values = [];

for i= 1:20
  singular_values = [singular_values;S(i,i)];
endfor

figure(2);
overall_contribution= 0;
for i=1:20
  overall_contribution =overall_contribution + singular_values(i);
endfor

fractions=[];
for i= 1:20;
  fraction_of_overall_contribution= singular_values(i)/ overall_contribution;
  fractions = [fractions; fraction_of_overall_contribution];
endfor
b = bar(fractions);

for i= 1:rows(S);
  for j = 1:columns(S);
    if 1==j
      if i>2
        S(i,j) = 0;
      endif
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
for i= 3:20
  f= squared_s_v(i)/sum;
   percent_of_loss = percent_of_loss +f;
endfor
percent_of_loss   

