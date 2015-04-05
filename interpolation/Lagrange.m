function fxg=Lagrange(totalPoints,xValues,fValues,xg)

% Initialize
fxg = 0;

for i = 1:totalPoints
    % Calculate lagrange polynomial numerator
    numerator = 1;
    denominator = 1;
    for j = 1:totalPoints
        if i~=j
            numerator = numerator * (xg - xValues(j));
            denominator = denominator * (xValues(i) - xValues(j));
        end
    end

    fxg = fxg + numerator / denominator * fValues(i);
end
