function J = J_sum(x,y,a,b,c)
S = size(y);
N = S(1);
sum = 0;

for i=1:N
  x1 = [x(1,i); x(2,i)];
  sum = sum + (y(i)- a*exp(-b*norm(x1-c)^2))^2;
end

J = sum/N;
  
