function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

square_error = (X * Theta' - Y) .^ 2; 

J = sum(sum (square_error .* R)) / 2;

regularization_term  = (sum(sum(X .^ 2)) + sum(sum(Theta .^ 2))) * lambda / 2;
J = J + regularization_term;

% compute X_grad

for i = 1:num_movies
  % row verctor of users that rated the movie
  idx =   find(R(i,:) == 1);                 % [ 1x max_num_users]
  Theta_temp = Theta(idx, :);                % [ max_num_users x num_features]
  Y_temp = Y(i, idx);                        % [ 1 x mux_num_users]
  
  pred = X(i, :) * Theta_temp';              % [ 1 x num_features] * [num_features * max_num_users] = [1 x max_num_users]
  pred_error = pred - Y_temp;                % [1 x max_num_users]
 
  X_grad(i, :) = pred_error * Theta_temp;    % [1 x max_num_users] * [ max_num_users x num_features] = [ 1 x num_features]  
  
  %% add regularization
  regularization_term = lambda * X(i, :);    % [ 1 x num_features]
  X_grad(i, :) = X_grad(i, :) + lambda * X(i, :);
  
endfor

for j = 1:num_users
 
  idx = find (R(:, j) == 1);                 % [max_num_movies x 1]
  X_temp = X(idx, :);                        % [max_num_movies x num_features]

  Y_temp = Y(idx, j);                        % [max_num_movies x 1]
  
  pred = X_temp * Theta(j, :)';              % [max_num_movies x num_features] * [num_features x 1] = [max_num_movies * 1]
  pred_error = pred - Y_temp;                % [max_num_movies x 1]
  
  
  Theta_grad(j, :) = pred_error' *  X_temp;  % [1 x max_num_movies] * [max_num_movies x num_features] = [ 1 x num_features]
  
  regularization_term = lambda * Theta(j, :);% [ 1 x num_features]
  
  Theta_grad(j, :) = Theta_grad(j, :) + regularization_term; 
  
endfor


% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
