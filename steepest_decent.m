%set starting values
t = 0;
x0 = [-8 -6].';
Nf = 0;
B = 0.05;

%calculate stating function value and gradient
g0= g_function(x0);
J0=J_function(x0);

% set values to enter loop
J=J0;
xt = x0;

%create vectors to be filled up
alfas = [];
times = [];
function_values = [];

%calculate stepsize for first step
alfa0 = 0.001*(norm(x0)/norm(g0));
% stepsize to enter loop
alfat=alfa0;

%set previous x to enter loop
x_previous=[0.001 0.001]; 

%norm(xt-x_previous)/norm(x_previous)>=0.01

while ((Nf < 1000) && norm(g_function(xt)) >10^-6)
    
    %calculate new x and function values
    xnext=xt-alfat*g_function(xt);
    Jnext=J_function(xnext);
    
    if Jnext > J 
        % calculate new alfa
        alfat= (1-B)*alfat;
        
        %step
        Nf=Nf+1; 
  
        
    else
        %save values
        alfas = [alfas, alfat];
        times = [times, t];
        function_values = [function_values, J];
        
        %set parameters
        x_previous=xt;
        xt=xnext;
        J=Jnext;
        
        %calculate new alfa
        alfat=(1+B)*alfat;
        
        %step
        Nf=0;
        t=t+1;
    end
end

%plot results
plot(times, alfas);
title('Steepest decent: Alfa over time')
xlabel('Time')
ylabel('Alfa')
figure()
plot(times, function_values);

plot(times, function_values);
title('Steepest decent: Function values over time')
xlabel('Time')
ylabel('J(x)')

% minimum values
x_min = xt
J_min = J
        

    
    
    
    
    
        
        
  
    
