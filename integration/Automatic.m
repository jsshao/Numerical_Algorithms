function [result,errorEstimate,levelsUsed]= Automatic(a,b,nInitial,F,tolerance,maxLevels)

% Check the initial n is a power of 2
if 2^(floor(log2(nInitial))) ~= nInitial 
    error('Initial number of intervals is not a power of 2');
end

% Simpson aprox for nInitial / 2 used for error calculation
prevApprox = Simpson(a, b, nInitial/2, F);
n = nInitial;

% Try at most maxLevels
for i=1:maxLevels
    newApprox = Simpson(a, b, n, F);
    errorEstimate = newApprox - prevApprox;
    
    % Stoping condition for tolerance
    if abs(newApprox - prevApprox) <= tolerance
        result = newApprox;
        levelsUsed = i;
        return
    end

    % Reset approximation and double the number of intervals
    prevApprox = newApprox;
    n = n*2;
end

% Exceeded max levels
result = newApprox;
levelsUsed = maxLevels;
