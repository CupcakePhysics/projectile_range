clc
clf
clear all

%% Simulation Parameters
% These are the parameters that you can change.
% N is the total number of data points per run.
% v is the initial speed of the projectile.
% g is the acceleration due to gravity.
% heights are the heights of the cliff on each run.

N = 100;
v = 10;
g = 9.8;
heights = [0, 2, 4, 6, 8];

%% Check Values
% A series of checks to make sure that the parameters make sense.

if N < 0
    error('The number of data points must be greater than zero.');
end

if v < 0
    error('The initial speed of the particle must be greater than zero.');
end

if g < 0
    error('The acceleration due to gravity must be positive in magnitude.');
end

for i = 1:5
    if heights(1,i) < 0
        error('The height of the cliff must be greater than zero.');
    end
end

%% Distance Function
% Calculates the total distance traveled by a projectile.
% theta is the launch angle as measured from the horizontal.
% h is the height of the cliff.

distance = @(theta, h) v*v*cos(theta)*sin(theta)/g ...
                       + v*cos(theta)*sqrt(v*v*sin(theta)*sin(theta) ...
                       + 2*g*h)/g;

%% Initialize Arrays
% These arrays will contain the final answers. Don't touch these!

thetas = linspace(0,pi,N);
h1 = zeros(1,N);
h2 = zeros(1,N);
h3 = zeros(1,N);
h4 = zeros(1,N);
h5 = zeros(1,N);

%% Calculate Distances
% Run through each of the heights and angles and calculate the distance the
% projectile travels.

for i = 1:N
    h1(1,i) = distance(thetas(1,i),heights(1,1));
    h2(1,i) = distance(thetas(1,i),heights(1,2));
    h3(1,i) = distance(thetas(1,i),heights(1,3));
    h4(1,i) = distance(thetas(1,i),heights(1,4));
    h5(1,i) = distance(thetas(1,i),heights(1,5));
end

%% Plot Results

set(gca,'FontSize',16);
plot(thetas,h1,thetas,h2,thetas,h3,thetas,h4,thetas,h5)
title('Distance Traveled vs. Angle of Launch')
xlabel('Angle of Launch [radians]')
ylabel('Total Distance Traveled in X-Direction [meters]')
legend('h1','h2','h3','h4','h5')
