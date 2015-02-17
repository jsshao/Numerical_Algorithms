function y = ForwardSubstitution(LU, b)
% Usage: y = ForwardSubstitution(LU, b)
% Perform forward substitution using the unit
% lower triangular portion of the matrix LU.

rows = size(LU, 1);
columns = size(LU, 2);

% Error checking
if rows ~= columns
	error('Input matrix must be square matrix');
	return
end

y = b;

% Solve each component of y, row by row
for i = 2:rows
	for j = 1:(i-1)
		y(i) = y(i) - LU(i, j) * y(j);
	end
end
