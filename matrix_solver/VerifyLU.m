function err = VerifyLU(n)

% Generate a random matrix
A = rand(n);
b = rand(n,1);

% Perform an LU decomposition
LU = LUFactorization(A);
y = ForwardSubstitution(LU, b);
x = BackwardSubstitution(LU, y);

% Compare with the built-in MATLAB solver
err = norm(x - A\b);
