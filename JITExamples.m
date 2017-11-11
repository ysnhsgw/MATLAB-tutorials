%% 1.1 Without changing datatypes
tic
x = 1; y = 'a';
for n = 1:1e6
    x = 1;
    y = 'a';
end
toc

%% 1.2 With changing datatypes
tic
for n = 1:1e6
    x = 1;
    x = 'a';
end
toc


%% 1.1 Slow nonlinear loop indices
tic
for A = 1:100000
    for B = [1 2 4 8]
        A*B;
    end
end
toc

%% 1.2 Fast linear loop indices
tic
B = [1 2 4 8];
for A = 1:100000
    for k = 1:numel(B)
        A*B(k);
    end
end
toc

%% The order of IF Statements
X = rand(10,1000000);
tic

for n = 1:1000000
    if  ( sum(X(:,n)) > 5 ) || ( X(1,n) > 0.5 )
       ... 
    end
end

toc