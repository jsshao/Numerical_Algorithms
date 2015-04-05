function [result,errorEstimate,levelsUsed]= Automatic(a,b,nInitial,F,tolerance,maxLevels)

if 2^(floor(log2(nInitial))) ~= nInitial 
    error('Initial number of intervals is not a power of 2');
end

prevApprox = Simpson(a, b, nInitial/2, F);
n = nInitial;

for i=1:maxLevels
    newApprox = Simpson(a, b, n, F);
    if abs(newApprox - prevApprox) <= tolerance
        result = newApprox;
        errorEstimate = newApprox - prevApprox;
        levelsUsed = i;
        return
    end
    prevApprox = newApprox;
    n = n*2;
end

result = newApprox;
errorEstimate = newApprox - prevApprox;
levesUsed = maxLevels;
