%   Copyright 2007-2009 The MathWorks, Inc.
%   Last Edited: S. Wait Zaranek 4/14/2009

 function mysurf_avg = blockAvgRedo2(Nx,Ny,Nxavg,Nyavg)
%% Example 1 - Redo 2
% Input values Nx, Ny = 1500, Nxavg, Nyavg = 25;
%
% Create the surface and take block averages

%% Parameter Initialization

tic

Lx = 10; % x-direction length
Ly = 10; % y-direction length

x = linspace(1,Lx,Nx);  % Create x vector
y = linspace(1,Ly,Ny);  % Create y vector

%% Evaluate the function on the grid

% First use MESHGRID to create the grid
[ygrid,xgrid] = meshgrid(y,x);

mysurf = 5*cos((xgrid+ygrid)*2*pi)+...
    2*sin(xgrid*2*pi)+2*cos(xgrid*2*pi);








%% Take block averages

% Find the (x,y) points of averaging
xavg = x(Nxavg:Nxavg:Nx)- 0.5*(x(Nxavg)-x(1));
yavg = y(Nyavg:Nyavg:Ny)- 0.5*(y(Nyavg)-y(1));


% Take the average using RESHAPE and SUM
newX = (1:floor(Nx/Nxavg)*Nxavg);  % Get rid of excess points 
newY = (1:floor(Ny/Nyavg)*Nyavg);  % that will not be averaged

mysurf_avg = sum(reshape(mysurf(newX,newY),Nxavg,[]));
mysurf_avg = reshape((1/Nxavg)* mysurf_avg,floor(Nx/Nxavg),[]);

mysurf_avg = sum(reshape(mysurf_avg',Nyavg,[]));
mysurf_avg = reshape((1/Nyavg)* mysurf_avg,floor(Ny/Nxavg),[])';
toc














%% Plot the results

ax(1) = subplot(2,1,1);
plot1 = pcolor(y,x,mysurf);
set(plot1,'EdgeColor','none');
title('Original Function');
axis off

ax(2) = subplot(2,1,2);
plot2 = pcolor(yavg,xavg,mysurf_avg);
set(plot2,'EdgeColor','none');
title('Averaged Function');
axis off

linkaxes(ax,'x');