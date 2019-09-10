clear all 
close all
clc

% Set variables
alfa = 2;
B=0.05;
Nf=0;
d=2;
t=0;

%starting guess
x1=[4 9].';
x2=[7 8].';
x3=[3 2].';

% create a matrix of starting guesses
S= [x1 x2 x3].';

% calculate function values for starting guesses
J1=J_function(x1);
J2=J_function(x2);
J3=J_function(x3);

% create matrix of function values
J_values = [J1 J2 J3];

% create empty matrixes to fill
alfas = [];
times = [];
function_values = [];

% set parameters to enter loop
J_compare = J3;
conversion= 10;

while  Nf < 1000 && conversion > 10^-4
    
    % find starting point with highest function value, save and delete
    [M,I] = max(J_values);
    Xm = S(I,:).';
    S(I,:) = []; 
    
    % calculate centroid
    c= 1/d*sum(S).';
    
    % return stating point with highest function value to matrix
    S= [S, Xm].';
    
    % calculate new xguess and the function value for the new guess
    xnext = c + alfa*(c-Xm);
    Jnext=J_function(xnext);
    
     %if  new function value is higher than the latest function value
        %reduce stepsize
    if Jnext > J_compare
        
        alfa= (1-B)*alfa;
        Nf=Nf+1;
    
    else 
       % save values to plot
       alfas = [alfas, alfa];
       times = [times, t];
       function_values = [function_values, Jnext];
       
       % increase stepsize
       alfa= (1+B)*alfa;
       
       % delete the values of the point with highest function values
       S(I,:) =[]; 
       J_values(I)=[];
       
       % Add the values of the new point
       J_values= [J_values, Jnext];
       S= [S, xnext].';
       
       % save function value of lates added value to compare
       J_compare=Jnext;
       
       % iterate
       t=t+1;
       Nf=0;
       
       %save possible last values
       X_min=xnext;
       J_min=Jnext;
       %calculate conversion
       conversion= norm(xnext-Xm)/norm(Xm);
       
    end
end

%plot results
plot(times, alfas);
title('Simplex: Alfa over time')
xlabel('Time')
ylabel('Alfa')
figure()
plot(times, function_values);

plot(times, function_values);
title('Simplex: Function values over time')
xlabel('Time')
ylabel('J(x)')

X_min



        
     







    