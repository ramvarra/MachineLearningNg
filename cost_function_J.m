## Copyright (C) 2015 rrvarra
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} cost_function_J (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: rrvarra <rrvarra@RRVARRA-HOME>
## Created: 2015-02-15

function J = cost_function_J (X, y, theta)

% X is the "design matrix" - training exmaples. shape: m x (n+1)
% y is class labels - m x 1 matrix
% theta  - (n+1) by 1 matrix (column vector of theta values)


[m, np1] = size(X);    % number of training examples and number of features(n) + 1

disp (sprintf ('X is (%d, %d)', m, np1))



h_theta = X * theta             % hypothesis
sq_errors = (h_theta - y) .^ 2  % square of errors

J = sum(sq_errors) / (2 * m)    % cost function 1/(2m) * sum of squares

endfunction
