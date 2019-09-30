function [y] = response_function_noise(x1,x2)

a = 1/2;
b1 = 2;
b2 = 2;
c1 = 2;
c2 = 3;

y1 = a*exp(-b1*(x1-c1)^2 - b2*(x2-c2)^2);
noise = normrnd(0,y1/10);
y = y1 + noise ;
