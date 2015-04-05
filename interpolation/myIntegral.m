format long

% define the function F as an 'anonymous function'
F=@(x) exp(-x.*x);

% the integration interval
a=-2;
b=2;

% the number of intervals in the composite rule
n=12;

% invoke the Trapezoid and the Simpson rules...
resultTrapezoid = Trapezoid(a,b,n,F)
resultSimpson = Simpson(a,b,n,F)

% a highly accurate approximation
exact = 1.764162781524843

% the differences between your results and the highly accurate result;
% how do you compare... ?
% if you increase n above, the error should decrease
errorTrapezoid=exact-resultTrapezoid
errorSimpson=exact-resultSimpson
