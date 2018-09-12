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
## @deftypefn {Function File} {@var{retval} =} sqcube (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: rrvarra <rrvarra@RRVARRA-HOME>
## Created: 2015-02-15

function [sq, cube] = sqcube (x)

disp (sprintf ('Calcualting sq and cube of %d', x))
sq = x ^ 2;
cube = x ^ 3;

endfunction
