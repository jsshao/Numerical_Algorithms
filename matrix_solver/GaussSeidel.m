function x = GaussSeidel(A, b, x0, tol)
% Usage: x = GaussSeidel(A, b, x0, tol)
% Perform Gauss-Seidel iteration on the
% matrix A to solve Ax = b using the
% initial estimate x0.

rows = size(b, 1);

% Calculate the initial 2 norm for tolerance checking
init_residual = A*x0 - b;
init_norm = 0;

for i = 1:rows
	init_norm = init_norm + init_residual(i)^2;
end

init_norm = sqrt(init_norm);

% Initialize iterative variables
x_old = x0;
x_new = x_old;
norm = tol * init_norm + 1;

% Avoid when init_norm = 0, estimate is already perfect
if init_norm == 0
    x = x0
    return
end

% Iteratively solve for x_new
while norm / init_norm >= tol
	for i = 1:rows
		x_new(i) = b(i);
		
		for j = 1:(i-1)
			x_new(i) = x_new(i) - A(i, j) * x_new(j);
		end

		for j = (i+1):rows
			x_new(i) = x_new(i) - A(i, j) * x_old(j);
		end

        % Avoid divide by 0
        if A(i, i) == 0
            error('Diagonal value in matrix is 0');
        end

		x_new(i) = x_new(i) / A(i, i);
	end	

	% Calculate new norm
    residual = A * x_new - b;
	norm = 0;
	for i = 1:rows
		norm = norm + residual(i)^2;
	end
    norm = sqrt(norm);


    % Reset x_old for next iteration
	x_old = x_new;
end

x = x_new;
