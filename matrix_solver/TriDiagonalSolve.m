function x = TriDiagonalSolve(a, b, c, k)
% Usage: x = TriDiagonalSolve(a, b, c, k)
% Completely solve the system Ax = k, where
% A is a tri-diagonal matrix. The column vectors
% a, b, c describe the diagonal entries of the
% matrix. a(1) and c(n) are ignored here.

rows = size(b, 1);

% LU Decomposition
% NOTE: there's no need to solve for u since u = c 
% Solve for l and d
l = b;
d = b;

for i = 2:rows
    % Divide by zero check
    if d(i-1) == 0
        error('Diagonal value in LU Decomposition equals 0');
    end
    l(i) = a(i) / d(i-1);
    d(i) = b(i) - c(i-1)*l(i);
end


% Backward substitution to solve Ly = k
y = k;
for i = 2:rows
    y(i) = k(i) - l(i)*y(i-1);
end


% Forward subsitution to solve Ux = y
% Divide by zero check
if d(rows) == 0
    error('Diagonal value in LU Decomposition equals 0');
end
x = y;
x(rows) = x(rows) / d(rows);

for i = (rows-1):-1:1
    % Divide by zero check
    if d(i) == 0
        error('Diagonal value in LU Decomposition equals 0');
    end
    x(i) = (y(i) - c(i)*x(i+1)) / d(i);
end
