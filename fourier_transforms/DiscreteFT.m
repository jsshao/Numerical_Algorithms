function F = DiscreteFT(f)
% Usage: F = DiscreteFT(f)
% Compute the discrete Fourier transform F
% of the complex vector f using the direct
% formula. F is the computed complex DFT.

% dimension of vector
N = size(f, 1);

% Initialize result to empty column vector
F = zeros(N, 1);

for k = 0:(N-1)
    for n = 0:(N-1)
        F(k+1) = F(k+1) + f(n+1) * exp(-i*2*pi/N*k*n);
    end

    F(k+1) = F(k+1) / N;
end

