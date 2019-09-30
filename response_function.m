function [y] = response_function(x1,x2)

a = 1/2;
b1 = 2;
b2 = 2;
c1 = 2;
c2 = 3;

y = a*exp(-b1*(x1-c1)^2 - b2*(x2-c2)^2);



