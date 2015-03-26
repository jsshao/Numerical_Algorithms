X=imread('image1.jpg');

s=size(X);
offset1 = mod(8-mod(s(1),8),8);
offset2 = mod(8-mod(s(2),8),8);
if offset1 ~= 0 | offset2 ~= 0
    X(s(1)+offset1, s(2)+offset2, 3) = 0;
end

figure(1)
image(X);
axis image
axis off
