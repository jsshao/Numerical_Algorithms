function LU = LUFactorization(A)
% Usage: LU = LUFactorization(A)
% Compute the LU factorization of the matrix A
% and return the resulting factorized matrix.

rows = size(A, 1);
columns = size(A, 2);

if rows ~= columns
	error('Input matrix must be square matrix');
end

% Initialize L to be identity matrix
L = eye(rows);

for i = 1:(rows-1)
	% Pivot at the ith diagonal value
	pivot = A(i, i);

	% Error checking
	if pivot == 0
		error('Pivot evaluated to 0 during the LU decomposition');
	end
	
	% Start to row reduce every row below pivot
	for j = (i+1):rows
		factor = -A(j, i) / pivot;
		L(j, i) = -factor;  % Negate value because L is the inverse 
		A(j, i) = 0;	

		% Subtract the rest of column
		for k = (i+1):rows
			A(j, k) = A(j, k) + factor * A(i, k);
		end
	end
end

% Compress L and U together
% L now holds the Lower matrix and A holds the Upper matrix

% Copy upper elements from U (variable A) to L
for i = 1:rows
	for j = i:rows
		L(i, j) = A(i, j);
	end
end

% Return the compressed matrix
LU = L;
