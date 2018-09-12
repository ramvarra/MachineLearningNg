function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad


% X = [m x num_features]
% y = [m x 1]
% theta = [num_features x 1]


% Initialize some useful values
m = length(y); % number of training examples 

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));  % [num_features x 1]

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


h_of_x = X * theta;  % [m x num_features] * [num_features x 1] = [m x 1]
square_errors = (h_of_x - y) .^ 2;  % [m x 1]
J = (sum(square_errors) + lambda * sum(theta(2:end) .^ 2)) / (2 * m);    % scalar

d_theta_tmp1 = (h_of_x - y)' * X; % [1 x m ] * [m x num_features] = [1 x num_features]
d_theta_tmp2 = d_theta_tmp1';  % [num_features x 1]

grad = (d_theta_tmp2 + lambda * [0; theta(2:end)]) / m; % [num_features x 1]








% =========================================================================

grad = grad(:);

end
