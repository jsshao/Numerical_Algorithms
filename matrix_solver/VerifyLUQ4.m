function time = VerifyLUQ4(n)

start_time = cputime;

% Create A and b
A = ones(n) + (n-1)*eye(n);
b = ones(n, 1);

% Perform an LU decomposition
LU = LUFactorization(A);
y = ForwardSubstitution(LU, b);
x = BackwardSubstitution(LU, y);

time = cputime - start_time;
