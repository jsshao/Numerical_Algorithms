format long

% Define the function
F=@(x) (exp(-x.*x)*sin(12*x) + 1);

% Exact value
exact = 5.08454268897537;

% Limits of integration
a = 0;
b = 5;

% Configure automatic integration settings
nInitial = 2;
tolerance = 10^(-3);
maxLevels = 10;

[result, err, levels] = Automatic(a, b, nInitial, F, tolerance, maxLevels);
'For tolerance = 10^-3'
levels
result
err
exact - result


% Set tolerance to 10^(-6)
tolerance = 10^(-6);
[result, err, levels] = Automatic(a, b, nInitial, F, tolerance, maxLevels);
'For tolerance = 10^-6'
levels
result
err
exact - result
