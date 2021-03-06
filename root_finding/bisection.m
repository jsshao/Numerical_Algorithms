function root = bisection(f, a, b, t)
% Usage: bisection(f, a, b, t)
% This method uses bisection to find roots of
% f in the interval [a, b] with tolerance t.

% Preliminary check that intermediate value theorem does apply
if f(a) * f(b) > 0
	warning('f(a) and f(b) must be of opposite signs')
else
	while abs(b-a) > t
		c = (a + b)/2;
		if f(c) == 0
			break  % root has been found
		end
		
		% set right endpoint to the midpoint
		if f(a)*f(c) <= 0
			b = c;
		% set left endpoint to the midpoint
		else
			a = c;
		end
	end

	% Calculated root
	root = (a + b)/2;
end
