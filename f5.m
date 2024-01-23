clc;
clear;

B = magic(5);

[U, S, V] = svd(B);

disp(S)