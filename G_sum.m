function [da,db,dc] = G_sum(x,y,a,b,c)

% Set parameters
S = size(x);
N = S(2);
S1= size(b);
N2 = S1(1);
suma = 0;
sumb = zeros(N2,1);
sumc = zeros(N2,1);


for i=1:N
    exp_sum = 0; 
   
   for j = 1:N2
   exp_sum = exp_sum + b(j)*((x(j,i)-c(j))^2);
   end
   
   y_hat = a*exp(-exp_sum);
   
   suma = suma + (y(i)- y_hat)*y_hat/a;
   for k= 1:N2
   sumb(k) = sumb(k) + (y(i)- y_hat)* -1*((x(k,i)-c(k))^2)*y_hat;
   sumc(k) = sumc(k) + (y(i)- y_hat)*2*(x(k,i)-c(k))*b(k)*y_hat;
   end 
   
end

da = -2*suma/N;
db = -2*sumb/N;
dc = -2*sumc/N;
