function [] = main()
x = linspace(0.1, 6, 300); % from domain 0.1 and 6, pick 300 points
y = [];
for i = x
	% Calculate the function root using either newton or secant
	if randi([0,1]) == 1
    	root = secant(set_solar(i), 2, 4, 0.001);     % set tolerance to 0.001
	else
		root = newton(set_solar(i), inline('1 - 1/x'), 2, 0.001);
	end

	% root = (v / c)^2 so I take the sqrt
	root = sqrt(root);
    y(end+1) = root; 
end
scatter(x,y);

% instantiate the solar function based on radius value
function f = set_solar(radius)
precalculation = 4*log(radius) + 4/radius - 3;
f = inline(strcat('x - log(x) - ', num2str(precalculation)));
