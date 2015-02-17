function fvec = ApplyF(f, tvec)

fvec = zeros(length(tvec),1);
for i=1:length(tvec)
  fvec(i) = f(tvec(i));
end