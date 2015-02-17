function err = VerifyLU()

% Generate a random matrix
A = vander([10.0 : 0.1 : 11.0]);
b = [1; 9; 1; 9; 1; 9; 1; 9; 1; 9; 1]; 

% Perform an LU decomposition
LU = LUFactorization(A);
y = ForwardSubstitution(LU, b);
x = BackwardSubstitution(LU, y);

% Compare with the built-in MATLAB solver
res = A*x
err = norm(x - A\b);
