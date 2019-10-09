M = eye(5);
M = M*2;

for i = 1:5
    a = mod(i,2);
    for j = 1:5
        b = mod(j,2);
        if ((i ~= j) && (a ~= 0) && (b ~= 0))
            M(i,j) = 5;
        end
    end
end