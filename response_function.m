function [y] = response_function(x1,x2)

a = 1/2;
b = 2;
c1 = 2;
c2 = 3;

y = a*exp(-b*((x1-c1)^2 + (x2-c2)^2));



