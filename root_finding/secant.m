function root = secant(f, x0, x1, t)
% Usage: secant(f, x0, x1, t)
% This method uses the secant method to
% find roots of f using initial estimates
% x0 and x1

max_iter = 10000;
i = 0;

while true
	% Check for divide by 0
	if f(x0) - f(x1) == 0
		warning('Secant has a delta y of 0')
		return
	end 

	x = x1 - f(x1) * ((x1 - x0) / (f(x1) - f(x0)));
	if abs(x - x1) < t
		break
	end

	x0 = x1;
	x1 = x;

	i = i + 1;
	if i > max_iter
		warning('Algorithm exceeded max iterations of 10000. Check input function initial estimates');
		return
	end
end

% Calculated root
root = x;
