function [] = errorFuncScript()
    resultsT = zeros(5, 1);
    resultsS = zeros(5, 1);
    errT = zeros(5, 1);
    errS = zeros(5, 1);

    for i=0:4
        [resultsT(i+1), resultsS(i+1), errT(i+1), errS(i+1)] = errorF(2^i);
    end

    % Trapezoid
    'Trapezoid'
    for i=0:4
        resultsT(i+1)
        errT(i+1)
        if i~= 0
            errT(i) / errT(i+1)
        end
    end

    'Simpson'
    for i=0:4
        resultsS(i+1)
        errS(i+1)
        if i~= 0
            errS(i) / errS(i+1)
        end
    end
end

function [resultTrapezoid, resultSimpson, errorTrapezoid, errorSimpson] =  errorF (n)
    % Create function
    F=@(x) exp(-x.*x);

    % Compute apporximations
    resultTrapezoid = 2 / sqrt(pi) * Trapezoid(0, 1, n, F);
    resultSimpson = 2 / sqrt(pi) * Simpson(0, 1, n, F);

    % a highly accurate approximation
    exact = 0.84270079294971;

    % Show truncation errors
    errorTrapezoid = exact - resultTrapezoid;
    errorSimpson = exact - resultSimpson;
end
