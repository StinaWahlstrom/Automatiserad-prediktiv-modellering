clear all
close all
clc

% Dimensions
d = 10;

% Start guess
a = 0.25;
b = [1;1;1;1;1;1;1;1;1;1];
c = [4;4;4;4;4;4;4;4;4;4];


rmse = zeros(1,200);

% create vectors to be filled
a_values = [];
b_values = [];
c_values = [];
q = zeros(1, 100);

% Generate a big test set
[Big_x_values, Big_y_values] = data_generator(10000);

% Big_x_values = 6*rand(d,10000);
% Big_y_values = zeros(10000,1);
% 
% for i = 1:10000
%     Big_y_values(i) = response_function_noise(Big_x_values(1,i),Big_x_values(2,i));
% end 
% 

%Generate  100 different models using 100 different test sets
for i = 1:100
    %generate training set
    [x_values , y_values] = data_generator(400);
    
    % estimate model
    [a , b, c] = variable_estimator(a, b, c, x_values,y_values);
    
    % calculate rmse for training dataset
    rmse(i) = sqrt(J_sum(x_values, y_values, a, b, c));
   
    % save the different models
    a_values = [a_values, a];
    b_values = [b_values, b];
    c_values = [c_values, c];
   
    % test models using the big data set ( calculate rmse)
    q(i) = sqrt(J_sum(Big_x_values, Big_y_values, a, b, c));
    
end


histogram(rmse);
title('RMSE train')
figure()
histogram(a_values)
title('A')
for i = 1:10
 
        subplot(5,2,i);
        histogram(b_values(i,:))
    
end     
suptitle('b-values')

for i = 1:10
 
        subplot(5,2,i);
        histogram(c_values(i,:))
    
end     
suptitle('c-values')

figure()
histogram(q)
title('RMSE Test')



    