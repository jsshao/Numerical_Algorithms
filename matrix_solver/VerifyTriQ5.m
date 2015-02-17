function time = VerifyTriQ5(n)

start_time = cputime;

% Initialize a, b, c
a = ones(n-1);
b = -2*ones(n-1);
c = ones(n-1);


% Create k 
h = 1 / n;
f = inline('16*pi*cos(8*pi*t^2) - 256*pi^2*t^2*sin(8*pi*t^2)');
k = ones(n-1, 1);
for i = 1:(n-1)
    k(i) = f(i / n);
end
k = k * h^2;

% Solve using TriDiagonal LU
x = TriDiagonalSolve(a, b, c, k);

time = cputime - start_time;
