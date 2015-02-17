function b = determine_b

% determine_b =  Determine the base of the floating point number system on
% this computer

a = 1;
while ((a+1) -a) == 1,
   a = a*2
end
i = 1;
while (a == (a+i)),
   i = i + 1
end
b = (a + i) - a;
