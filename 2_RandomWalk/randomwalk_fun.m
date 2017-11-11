function distance = randomwalk_fun();

dim = 2;

N = 1000;
A = [eye(dim); -eye(dim)];
r = randi(2*dim,[N 1]);
x = [zeros(1,dim); cumsum(A(r,:))];

distance = norm(x(end,:));
