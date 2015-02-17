function err = VerifyTriDiagonal(n)

% Generate random columns
a = rand(n,1);
b = rand(n,1);
c = rand(n,1);
k = rand(n,1);

% Convert to a matrix
A = zeros(n);
for i=1:n
  if i~=n
    A(i+1,i) = a(i+1);
    A(i,i+1) = c(i);
  end
  A(i,i) = b(i);
end

% Solve using TriDiagonal LU
x = TriDiagonalSolve(a, b, c, k);

% Compare with the built-in MATLAB solver
err = norm(x - A\k);
