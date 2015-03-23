function F = ButterflyFFT(f)
% Usage: F = ButterflyFFT(f)
% Compute the discrete Fourier transform F
% of the complex vector f using the
% non-recursive butterfly algorithm for the
% fast Fourier transform. F is the computed
% complex DFT.

% dimension of vector
N = size(f, 1);

% Error check for power of 2 check
if 2^(floor(log2(N))) ~= N 
    error('Column vector is not a power of 2');
end

f = bitrevorder(f);

for iter = 1:log2(N)
    root_unity_factor = N/(2^iter);    
    F = f;

    for n = 1:N/2
        factor = floor((n-1) / root_unity_factor) * root_unity_factor;
        F(n) = 1 / 2 * (f(2*n - 1) + f(2*n) * exp(-i*2*pi/N*factor));
        F(n + N/2) = 1 / 2 * (f(2*n -1) - f(2*n) * exp(-i*2*pi/N*factor));
    end
    f = F;
end
