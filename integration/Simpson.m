function result=Simpson(a,b,n,F)

% Initialize the endpoint conditions as well as the weight of the first midpoint
result = F(a) + F(b) + 4*F((a + a + (b-a)/n)/2);

% Simpson rule adds 4 times each midpoint
% each internal point is used 2 times
for i=1:(n-1)
    result = result + 2*F(a + (b-a)*i/n);
    result = result + 4*F((a + (b-a)*i/n + a + (b-a)*(i+1)/n)/2);
end

% multiply by h = (b-a)/n and divide by 6
% for simpson rule
result = result * (b-a) / n / 6;
