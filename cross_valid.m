% Task 

% set a parameter
a = 0.25;

% set b parameter, choose either 2 or 10 dimensions
%b = [1;1];
%c = [4;4];
b = [1;1;1;1;1;1;1;1;1;1];
c = [4;4;4;4;4;4;4;4;4;4];

% genereate one set of test and train examples examples.
[x_values, y_values] = data_generator(400);

% create empty vector to fill.
rmse= [];

% devide the examples into one set for train and one for test 100 times
for i=1:100
    
    % devide examples into two different sets, one for train and one for
    % test
    ind = crossvalind('Kfold',y_values,2);
    
    % create empty vectors to fill
    test_x = [];
    test_y = [];
    train_x = [];
    train_y = [];
    
    
    % put the test and train examples into different vectors
    for j=1:400
        if ind(j) == 1
            train_x = [train_x, x_values(:,j)];
            train_y = [train_y, y_values(j)];
        else
            test_x = [test_x, x_values(:,j)];
            test_y = [test_y, y_values(j)]; 
        end
    end
    
    % estimata a model (a,b,c) using the train examples
    [a ,b, c] = variable_estimator(a, b, c, train_x, train_y.');
    
    % test the model by using the test datas and calculate the rmse
    q = sqrt(J_sum(test_x, test_y', a, b, c));
    
    
    % save the rmse:s
    rmse = [rmse, q];
    
end

% plot rmse
figure()
histogram(rmse)
title('RMSE cross-validation')
         
            
            
        