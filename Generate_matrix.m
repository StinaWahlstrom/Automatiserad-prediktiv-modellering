clc 
close all
clear all

x_values = normrnd(0,2,2,200);
y_values = zeros(200,1);

for i = 1:200
    y_values(i) = response_function(x_values(1,i),x_values(2,i));
end 

%set starting values
t = 0;
eps = 0.5;
Nf = 0;
Beta = 0.05;

% start guess
a = 1/2 + eps;
b = 2 + eps;
c1 = 2+ eps;
c2 =  3+ eps;
teta_guess = [a; b; c1 ;c2];

%calculate starting function value and gradient
[da,db,dc1,dc2]= G_sum(x_values,y_values,a,b,c1,c2);
J0= J_sum(x_values,y_values,a,b,[c1;c2]);

% set values to enter loop
J=J0;
grad = [da; db; dc1; dc2];
teta = teta_guess;

%create vectors to be filled up
alfas = [];
times = [];
function_values = [];
a_values = [];
b_values = [];
c1_values = [];
c2_values = [];

%calculate stepsize for first step
alfa0 = 0.001*(norm(teta_guess)/norm(grad));
% stepsize to enter loop
alfat=alfa0;


while ((Nf < 1000) && norm(grad) > 10^-5)
    
    %calculate new x and function values
    %[da,db,dc1,dc2] = G_sum(x_values,y_values,teta(1),teta(2),teta(3),teta(4));
    teta_next = teta-alfat*grad;
    Jnext=J_sum(x_values,y_values,teta_next(1),teta_next(2),[teta_next(3);teta_next(4)]);
    
    if Jnext > J 
        % calculate new alfa
        alfat= (1-Beta)*alfat;
        
        %step
        Nf=Nf+1; 
  
        
    else
        %save values
        alfas = [alfas, alfat];
        times = [times, t];
        function_values = [function_values, J];
        a_values = [a_values, teta_next(1)];
        b_values = [b_values, teta_next(2)];
        c1_values = [c1_values, teta_next(3)];
        c2_values = [c2_values, teta_next(4)];
        
        %set parameters
        teta = teta_next;
        J=Jnext;
        
        %calculate new alfa
        alfat=(1+Beta)*alfat;
        
        %step
        Nf=0;
        t=t+1;
        [da,db,dc1,dc2]=G_sum(x_values,y_values,teta(1),teta(2),teta(3),teta(4));
        grad = [da; db; dc1; dc2];
    end
end

%plot results
plot(times, alfas);
title('Steepest decent: Alfa over time')
xlabel('Time')
ylabel('Alfa')

figure()
plot(times, function_values);
title('Steepest decent: Function values over time')
xlabel('Time')
ylabel('J(x)')

figure()
plot(times, a_values);
hold on
plot(times, b_values);
plot(times, c1_values);
plot(times, c2_values);
legend('a-value', 'b-value', 'c1-value', 'c2-value');
title('teta-variables change over time')
xlabel('Time')


% minimum values
abc_min = teta
J_min =  J
        


    
        
    