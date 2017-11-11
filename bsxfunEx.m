%% Subtract the means from the columns of A

A = [2 5 -2; 4 1 3; 0 6 2]
bsxfun(@minus,A,mean(A));

%% Compare times
A = rand(1000);
tic
Anew1 = zeros(size(A));
for n = 1:size(A,2);
    Anew1(:,n) = A(:,n)-mean(A(:,n));
end
toc

tic
Anew2 = bsxfun(@minus, A, mean(A));
toc

isequal(Anew1,Anew2)

%% Compare the rows of A, to each corresponding row of P
A = [-1 0 3; 6 8 7; 11 7 13];
P = [1
     5
     10];

bsxfun(@gt, A, P)