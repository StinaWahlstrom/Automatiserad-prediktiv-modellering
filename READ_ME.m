% READ ME 

%% TASK A 
% The function data_generator.m generates noise free data using the
% response_function.m

%% TASK B
% The matlab script variable_estimator_plots creates a training dataset of
% 400 examples using the data_generator.m function and uses these examples 
% to estimate the variables a, b and c. It uses the function G_sum.m to
% calculate the gradient and J_sum.m to calculate the function values. It
% also plots, the variables, function value J(x), and the stepsize alfa as 
% a function of time. In the variable_estimator_plots.m you can choose
% weather you want to use 2 or 10 dimesnsions.

%% Task C 
% The Performance_calculations.m script is used to calculate the RMSE for a
% big testset of 10000 on 100 different models. The training datasets for the
% models are genereated through the data_generator.m and the variables
% estimated using the variable_estimator.m The vales for the variables in
% the different models are plotted using histograms and the RMSE for the
% big dataset on the models is also plotted. You can change in performance
% calculations weather you want 2 or 10 dimensions

%% Task D
% The Performance_calculations.m script is used once again. To add noise make a change
% in the data_geneartor.m function so that it uses the
% response_function_noise.m instead of the response_function.m

% for Task D (d) and (e) run the cross_valid.m script and choose between 2 or 10 dimensions. 



