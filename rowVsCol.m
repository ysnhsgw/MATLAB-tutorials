%% Which is faster, looping over rows or columns

%% Initialize variables
clear
N = 5000;
myRef = 0.5;

% Copy all elements of x greater than myRef into y

% Scan over rows (slow)
disp('Scanning over rows')

rng(0);
x = rand(N);
y = zeros(N);

tic

for r = 1:N % rows
    for c = 1:N % columns
        if x(r,c) > myRef
            y(r,c) = x(r,c);
        end
    end
end

toc

%% Scan over columns (faster)
disp('Scanning over columns')

rng(0);
x = rand(N);
y = zeros(N);

tic

for c = 1:N % columns
    for r = 1:N % rows
        if x(r,c) > myRef
            y(r,c) = x(r,c);
        end
    end
end
toc
%% Use linear indexing (fastest)
rng(0);
x = rand(N);
y = zeros(N);

tic
for n = 1:N^2
    if x(n) > myRef
        y(n) = x(n);
    end
end

toc
