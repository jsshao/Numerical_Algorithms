function result=Trapezoid(a,b,n,F)

% Initialize lengths for the endpoints
result = F(a) + F(b);

% Iterate through the internal points as
% each point is used in two trapezoids
for i=1:(n-1)
    result = result + 2*F(a + (b-a) * i / n);
end

% multiply by h (block width) and divide
% by 2 for trapezoidal rule
result = result * (b-a) / n / 2;
