clear all
close all
clc

% Dimensions (change between 2 or 10)
d = 10;
%d = 2;

% Start guess (change between two or 10 dimesions)
a = 0.25;
b = [1;1;1;1;1;1;1;1;1;1];
c = [4;4;4;4;4;4;4;4;4;4];
% b = [1,1];
% c = [4,4];

rmse = zeros(1,200);

% create vectors to be filled
a_values = [];
b_values = [];
c_values = [];
q = zeros(1, 100);

% Generate a big test set
[Big_x_values, Big_y_values] = data_generator(10000,d);


%Generate  100 different models using 100 different test sets
for i = 1:100
    %generate training set
    [x_values , y_values] = data_generator(400,d);
    
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

% Plot rmse for training datasets
histogram(rmse);
title('RMSE train')

% plot histograms of the distibution of the different variables
figure()
histogram(a_values)
title('A')
figure()
for i = 1:10
 
        subplot(5,2,i);
        histogram(b_values(i,:))
    
end     
suptitle('b-values')

figure()
for i = 1:10
 
        subplot(5,2,i);
        histogram(c_values(i,:))
    
end     
suptitle('c-values')

% plot the rmse for the big dataset
figure()
histogram(q)
title('RMSE Test')



    