% Task B - modification of steepest decent to estimate  a b and c
clc 
close all
clear all

% number of examples
N = 400;

% dimension ( choose 10 or 2)
%d = 10;
d = 2;

% generate data
[x_values, y_values] = data_generator(400,d);

%set starting values
t = 0;
Nf = 0;
Beta = 0.05;

% start guess a
a = 0.25;

% starting guess b and c, choose either 2 or 10 dimensions
b = [1;1];
c = [4;4];
%b = [1;1;1;1;1;1;1;1;1;1];
%c = [4;4;4;4;4;4;4;4;4;4];


%calculate starting function value and gradient
[da,db,dc]= G_sum(x_values,y_values,a,b,c);
J0= J_sum(x_values,y_values,a,b,c);

% set values to enter loop
J=J0;


%create vectors to be filled up
alfas = [];
times = [];
function_values = [];
a_values = [];
b_values = [];
c_values = [];


%calculate stepsize for first step
alfa0 = 10^(-4);

% stepsize to enter loop
alfat=alfa0;


while ((Nf < 5000) && J > 10^(-5))
    
    % take a step
    a_next = a - alfat*da;
    b_next = b - alfat*db;
    c_next = c - alfat*dc;
    
    % calculate function value after de step
    Jnext = J_sum(x_values,y_values,a_next,b_next,c_next);
    
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
        a_values = [a_values, a_next];
        b_values = [b_values, b_next];
        c_values = [c_values, c_next];
        
        %set parameters
        a = a_next;
        b = b_next;
        c = c_next;
        J = Jnext;
        
        %calculate new alfa
        alfat=(1+Beta)*alfat;
        
        %step
        Nf = Nf+1;
        t=t+1;
        
        %calculate next step
        [da,db,dc]=G_sum(x_values,y_values,a,b,c);
        
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
title('a-variable change over time')
xlabel('Time')
figure()
plot(times, b_values);
title('b-variables change over time')
xlabel('Time')
legend('b1', 'b2', 'b3', 'b4', 'b5','b6','b7','b8','b9','b10');
figure()
plot(times, c_values);
title('c-variables change over time')
xlabel('Time')
legend('c1', 'c2', 'c3', 'c4', 'c5','c6','c7','c8','c9','c10');




% minimum values
a_slut = a
b_slut = b
c_slut = c

J_min =  J