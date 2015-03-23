function F = CheckButterfly(n)
% Takes in a value creates a random vector
% of size 2^n and checks the butterfly FFT
% with the normal recursive FFT

v = rand(2^n, 1)

a = FastFT(v)
b = ButterflyFFT(v)

error = a - b; 

F = norm(error);

