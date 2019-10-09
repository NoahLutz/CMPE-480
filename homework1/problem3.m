function idx = problem3(x)
idx = [];
pri = isprime(x);
for i = 1 : length(pri)
    if pri(i) == 1
        idx = [idx i];
    end
end


% problem3([1,2,3,4,5,6,7,8]);