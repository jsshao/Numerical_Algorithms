function ArctanInter(n)

% Initialize to call Lagrange
xValues = zeros(n+1, 1);
fValues = zeros(n+1, 1);

% Calculate values for Lagrange interpolation
for i=0:n
    xValues(i+1) = -5 + i * 10 / n;
    fValues(i+1) = atan(xValues(i+1));
end

plotPoints = zeros(101, 1);
plotY = zeros(101, 1);

% 101 Interpolated values
for i=0:100
    plotPoints(i+1) = -5 + i*10/100;
    plotY(i+1) = Lagrange(n+1, xValues, fValues, plotPoints(i+1));
end

% Real values of arctan and its error
realY = atan(plotPoints);
errorY = realY - plotY;

plot(plotPoints, plotY, plotPoints, realY, plotPoints, errorY);
axis([-5 5 -5 5]);
title(['Lagrange Interpolation for Arctan(x) when n = ' int2str(n)]);
xlabel('x-values for -5 < x < 5') % x-axis label
ylabel('y-values') % x-axis label
legend('y_n(x)', 'arctan(x)', 'arctan(x) - y_n(x)', 'Location', 'northwest');
