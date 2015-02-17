function time = VerifyGaussSeidelQ4(n)

start_time = cputime;

% Create A and b
A = ones(n) + (n-1)*eye(n);
b = ones(n, 1);

% Solve using Gauss-Seidel
x = GaussSeidel(A, b, zeros(n,1), 1e-8);

time = cputime - start_time;
