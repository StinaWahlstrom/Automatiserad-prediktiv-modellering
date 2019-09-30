
% Create x and y matrices either with or without noise

function [x_values, y_values] = data_generator(N,d)


x_values = 6*rand(d,N);
y_values = zeros(N,1);

for i = 1:N
    % With noise
    %y_values(i) = response_function_noise(x_values(1,i),x_values(2,i));
    
    % Without noise
    y_values(i) = response_function(x_values(1,i),x_values(2,i));
end 