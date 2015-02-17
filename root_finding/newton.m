function root = newton(f, fprime, x0, t)

% Usage: newton(f, fprime, x0, t)
% This method uses Newton's method to
% find roots of f (with derivative fprime)
% with tolerance t using initial estimate x0.

max_iter = 10000;
i = 0;

while true
	% Check for divide by 0
	if fprime(x0) == 0
		warning('Derivative has equated to 0');
		return
	end

	x = x0 - f(x0) / fprime(x0);
	if abs(x -x0) < t
		break
	end 

	x0 = x;

	i = i + 1;
	if i > max_iter
		warning('Algorithm exceeded max iterations of 10000. Check input functiion, derivative amd initial estimate');
		return
	end
end

% Calculated root
root = x;
