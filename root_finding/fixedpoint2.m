function root = fixedpoint(g, x0, t)
% Usage: fixedpoint(g, x0, t)
% This method uses fixed point iteration to
% find fixed points of g with tolerance t
% using initial estimate x0

max_iter = 10000;
i = 0;

while true
	x = g(x0);

	% Found fixed point with enough tolerance
	if abs(x - x0) < t
		break
	end 
	x0 = x

	% Max iterations hit
	i = i + 1
	if i > max_iter
		warning('Algorithm exceeded max iterations of 10000. Check input function and initial estimate');
		return
	end
end

% Calculated fixed point
root =  x;
