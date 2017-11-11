function randomwalkexample2

N = 100000;
A = [1 0; -1 0; 0 1; 0 -1];
r = randi(4,[N-1 1]);
x = [0 0; cumsum(A(r,:))];

figure

axis equal;
grid on;
hold on;
xp = [];
for N = 400:400:100000
    delete(xp);
    xp = plot(x(1:N,1),x(1:N,2));
    drawnow;
end
plot(x(end,1),x(end,2),'ro','markersize',20,'linewidth',3);
plot(0,0,'rx','markersize',20,'linewidth',3);
