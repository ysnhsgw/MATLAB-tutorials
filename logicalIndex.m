%% Using logical indexing
% Find all values of A that are greater that myRef, and store them in "vals"

clear

N = 5000;
A = rand(N);  

myRef = 0.5; 



%%  Use a loop
tic

ix = 1;

vals = zeros(size(A(:)));

for jj = 1:N
    for ii = 1:N
        if A(ii,jj) > myRef
            vals(ix) = A(ii,jj);
            ix = ix + 1;
        end
    end
end

vals(ix:end) = []; %#ok<*NASGU>

toc

%% Use logical indexing
tic

vals = A(A > myRef);
 
toc