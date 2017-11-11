K = 10000;
D = zeros(K,1);

tic
for k = 1:K

    randomwalk_fun;
    D(k) = distance;
       
end
toc
M = mean(D)

