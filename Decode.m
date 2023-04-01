function out = Decode(variable, k1, k2)

v = 1;
s = 0;

for i = 1:length(variable)
    s = s + v * variable(length(variable) - i + 1);
    v = v * 2;
end

out = k1 * s + k2;

end