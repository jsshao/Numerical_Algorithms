function F = FastFT(f)
% Usage: F = FastFT(f)
% Compute the discrete Fourier transform F
% of the complex column vector f using the
% fast Fourier transform method. F is a
% column vector containing the computed
% complex DFT.

% dimension of vector
N = size(f, 1);

% Error check for power of 2 check
if 2^(floor(log2(N))) ~= N 
    error('Column vector is not a power of 2');
end

if N == 1
    F = f;
else
    F = zeros(N, 1);
    g = zeros(N/2, 1);
    h = zeros(N/2, 1);

    for n = 1:N/2
        g(n) = f(n) + f(n + N/2);
        h(n) = (f(n) - f(n + N/2))*exp(-i*2*pi/N*(n-1));
    end
        
    G = FastFT(g);
    H = FastFT(h);

    for n = 1:N/2
        F(n*2-1) = 1/2*G(n);
        F(n*2) = 1/2*H(n);
    end
end


