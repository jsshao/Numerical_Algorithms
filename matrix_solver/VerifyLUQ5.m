function time = VerifyLUQ5(n)

start_time = cputime;

% Initialize helper variables
h = 1 / n;
f = inline('16*pi*cos(8*pi*t^2) - 256*pi^2*t^2*sin(8*pi*t^2)');

% Create A
A = zeros(n-1);
for i = 1:(n-1)
    A(i, i) = -2;
end
for i = 1:(n-2)
    A(i, i+1) = 1;
    A(i+1, i) = 1;
end

% Create B
b = ones(n-1, 1);
for i = 1:(n-1)
    b(i) = f(i / n);
end
b = b * h^2;

% Perform an LU decomposition
LU = LUFactorization(A);
y = ForwardSubstitution(LU, b);
x = BackwardSubstitution(LU, y);

time = cputime - start_time;
