function [da,db,dc1,dc2] = G_sum(x1,y,a,b,c1,c2)

S = size(y);
N = S(1);
suma = 0;
sumb = 0;
sumc = 0;
c = [c1;c2];

for i=1:N
    x = [x1(1,i);x1(2,i)];
    
    suma = suma + (y(i)- a*exp(-b*norm(x-c)^2))*a*exp(-b*norm(x-c)^2)/a;
    sumb = sumb + (y(i)- a*exp(-b*norm(x-c)^2))*-a*exp(-b*norm(x-c)^2)*(norm(x-c)^2);
    sumc = sumc + (y(i)- a*exp(-b*norm(x-c)^2))*a*exp(-b*norm(x-c)^2)*2*b*(x-c);
    
end

da = -2*suma/N;
db = -2*sumb/N;
dc = -2*sumc/N;
dc1 = dc(1);
dc2 = dc(2);

    