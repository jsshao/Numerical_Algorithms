function x = BackwardSubstitution(LU, y)
% Usage: x = BackwardSubstitution(LU, y)
% Perform backward substitution using the
% upper triangular portion of the matrix LU.

rows = size(LU, 1);
columns = size(LU, 2);

% Error checking
if rows ~= columns
	error('Input matrix must be square matrix');
	return
end

x = y;

% Solve each component of x, row by row (bottom - up)
for i = rows:-1:1
	for j = (i+1):rows
		x(i) = x(i) - LU(i, j) * x(j);
	end 

    % Error check
    if LU(i, i) == 0
        error('LU has 0 entry in diagonal');
    end
	x(i) = x(i) / LU(i, i);
end
