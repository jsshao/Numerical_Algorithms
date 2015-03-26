function [Y, drop] = compress(X, tol)
% Usage: [Y, drop] = compress(X, tol)
% Compute a compressed image ’Y’ from an
% original input image ’X’ by dropping

% Fourier modes with modulus smaller
% than tolerance parameter ’tol’. The
% drop ratio is also returned via the
% parameter ’drop’.

s = size(X);

total_pixels = 0;
total_dropped = 0;

for col = 1:s(3)
    for x = 1:s(1)/8
        for y = 1:s(2)/8
            subarray = X((x*8-7):(x*8), (y*8-7):(y*8), col);
            trans = fft2(single(subarray));
            
            for j = 1:8
                for k = 1:8
                    if abs(trans(j, k)) < tol
                        trans(j, k) = 0;
                        total_dropped = total_dropped + 1;
                    end
                    total_pixels = total_pixels + 1;
                end
            end 

            X((x*8-7):(x*8), (y*8-7):(y*8), col) = real(ifft2(trans));
        end
    end
end

Y = X;
drop = total_dropped / total_pixels;

