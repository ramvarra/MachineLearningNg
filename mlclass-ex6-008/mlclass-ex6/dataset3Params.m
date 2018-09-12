function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

value_options = [.01 .03 .1 .3 1 3 10 30];
error_min = Inf;
C_min = NaN;
sigma_min = NaN;

for C = value_options
  for sigma = value_options
    fprintf ('Training SVM with C = %f sigma = %f\n', C, sigma);
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
    predictions = svmPredict(model, Xval);
    error = mean (double(predictions ~= yval));
    fprintf ('Error = %f (prev min = %f)\n', error, error_min);
    
    if error < error_min
      error_min = error;
      C_min = C; 
      sigma_min = sigma;
      fprintf ('Setting C_min = %f sigma_min = %f\n', C_min, sigma_min);
     endif
  end
end

fprintf ('Returning C_min = %f sigma_min = %f\n', C_min, sigma_min);
C = C_min;
sigma = sigma_min;

% =========================================================================

end
