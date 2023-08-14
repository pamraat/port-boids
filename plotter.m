clear

%% Flocking

n = 25;                                     % Number of robots
a = 0.01;                                   % Attraction tuning
b = 0.1;                                    % Separation tuning
c = 0.1;                                    % Alignment tuning
runTime = 100;                              % Run time.

k = 5;
p = 4;
% f = @(x, sets) fullFlock(x, sets);          % Full flock as neighbours
% f = @(x, sets) kNN(k, x, sets);             % k nearest as neighbours
f = @(x, sets) pGroups(p, x, sets);         % mod pth robot as neighbour

flocking(n, a, b, c, f, runTime);