function tol = compressionlevels(X)
% Pass in an image in X and 4 images will
% output each with a compression ratio of 0, 0.4,
% 0.85, 0.95. It finds the max fourier coefficient 
% then performs a binary search on the range [0, max]


% Find max
s = size(X);
max_coft = 0;

for col = 1:s(3)
    for x = 1:s(1)/8
        for y = 1:s(2)/8
            subarray = X((x*8-7):(x*8), (y*8-7):(y*8), col);
            trans = fft2(subarray);
            for j = 1:8
                for k = 1:8
                    max_coft = max(max_coft, trans(j, k));
                end
            end 
        end
    end
end

drop_ratios = [0, 0.4, 0.85, 0.95];

% We know tol0 has drop ratio 0 when tol0 = 0
tol(1) = 0;

% Binary search for other tolerances
for j = 2:4
    new_tol = drop_ratios(j);

    left = 0;
    right = max_coft;

    while (right - left > 1)
        m = (right + left) / 2;
        [Y, drop] = compress(X, m);

        if drop > new_tol
            right = m - 1;
        else
            left = m + 1;
        end
    end

    tol(j) = (left + right) / 2;
end

for j = 1:4
    [Y, drop] = compress(X, tol(j));
    figure(j);
    image(uint8(Y));
    axis image;
    axis off;
    title(strcat(strcat('Tolerance =  ', num2str(tol(j))), strcat(' for drop ratio of :  ', num2str(drop_ratios(j)))));
end

