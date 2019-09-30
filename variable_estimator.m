

function [a_slut, b_slut, c_slut] = variable_estimator(a, b, c,x_values, y_values); 


%set starting values
t = 0;
Nf = 0;
Beta = 0.05;


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


while ((Nf < 40000) && J > 10^(-5))
    
    a_next = a - alfat*da;
    b_next = b - alfat*db;
    c_next = c - alfat*dc;
    Jnext=J_sum(x_values,y_values,a_next,b_next,c_next);
    
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
        Nf=Nf+1;
        t=t+1;
        [da,db,dc]=G_sum(x_values,y_values,a,b,c);
        
    end
end



a_slut = a
b_slut = b
c_slut = c



J_min =  J
        