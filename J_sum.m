function J = J_sum(x,y,a,b,c)
S = size(x);
N = S(2);
S1 = size(b);
N2 = S1(1);
sum = 0;

for i=1:N
    exp_sum = 0; 
    for j = 1:N2
   exp_sum = exp_sum + -b(j)*(x(j,i)-c(j))^2;
    end
   y_hat = a*exp(exp_sum);
   sum = sum + (y(i) - y_hat)^2;
end

J = sum/N;