clc
clear all

f = @(x) 2*x + 1;
a = -2; b = 3;
tol = 1e-6;

[INt, Nt] = trapeziToll(a, b, f, tol)