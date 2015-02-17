function x = LUSolve(A, b)

LU = LUFactorization(A);
y = ForwardSubstitution(LU, b);
x = BackwardSubstitution(LU, y)
