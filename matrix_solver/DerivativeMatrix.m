function U = DerivativeMatrix(n)

U = zeros(n,n);

for r=1:n
  U(r,r) = -2;
end
for r=1:n-1
  U(r+1,r) = 1;
  U(r,r+1) = 1;
end
