function flocking(n, a, b, c, f, runTime)
% n = number of Robots
% a = Attraction tuning parameter
% b = Separation tuning parameter
% c = Alignment tuning parameter
% f = Neighborhood selection function
% runTime = Simulation run time
% Control of flocking animation is demonstrated in plotter.m. To switch on
% trajectory plotting, change plotTraj to true on line 47 of this file.
    switch nargin
        case 1
            a = 0.01;
            b = 0.1;
            c = 0.1;
            f = @(x, sets) fullFlock(x, sets);
            runTime = 60;
        case 2
            b = 0.1;
            c = 0.1;
            f = @(x, sets) fullFlock(x, sets);
            runTime = 60;
        case 3
            c = 0.1;
            f = @(x, sets) fullFlock(x, sets);
            runTime = 60;
        case 4
            f = @(x, sets) fullFlock(x, sets);
            runTime = 60;
        case 5
            runTime = 60;
        case 6
            
        otherwise
            n = 25;
            a = 0.01;
            b = 0.1;
            c = 0.1;
            f = @(x, sets) fullFlock(x, sets);
            runTime = 60;
    end
    lim = [0 0 500 500];
    
    dt = 0.1;
    simTime = 0;
    simUpdate = 0.01;
    runTime = runTime*dt/simUpdate;
    plotTraj = false;
    
    vel = 10;
    pose = [(lim(3) - lim(1))*rand(1, n) + lim(1);
            (lim(4) - lim(2))*rand(1, n) + lim(2);
            2*pi*rand(1, n)]';
    vel = [vel*cos(pose(:, 3)) vel*sin(pose(:, 3))];
    pose(:, 3) = [];
    if plotTraj, posData(:, :, 1) = pose; j = 2; end
    
    figure(1)
    p1 = scatter(pose(:, 1), pose(:, 2), 'o', 'filled', 'blue');
    hold on
    quiver(pose(:, 1), pose(:, 2), vel(:, 1), vel(:, 2), 'LineWidth', 2, 'MaxHeadSize', 0.5, 'Color', 'blue', 'AutoScaleFactor', 0.2);
    title("Boids Trajectory", "Interpreter","tex");
    xlabel("X (m)");
    ylabel("Y (m)");
    fontsize(gca,14,"points");
    xlim([lim(1) lim(3)]);
    ylim([lim(2) lim(4)]);
    set(gcf, 'Position',  [400, 150, 600, 500]);
    hold off
    
    while simTime <= runTime
        for i = 1:size(pose, 1)
            pRobots = f(pose(i, :), pose);
            vRobots = f(vel(i, :), vel);
            v(i, :) = flockingVelocity(pose(i, :), pRobots, vel(i, :), vRobots, a, b, c);
        end
        vel = v;
        pose = pose + vel*dt;
        pose = periodic(pose, lim);
        p1 = scatter(pose(:, 1), pose(:, 2), 'o', 'filled', 'blue');
        hold on
        if plotTraj
            posData(:, :, j) = pose; j = j + 1;
            for i = 1:size(pose, 1)
                plot(squeeze(posData(i, 1, :)), squeeze(posData(i, 2, :)), 'LineWidth', 0.1)
            end
        end
        quiver(pose(:, 1), pose(:, 2), vel(:, 1), vel(:, 2), 'LineWidth', 2, 'MaxHeadSize', 0.5, 'Color', 'blue', 'AutoScale','off');
        title("Boids Trajectory", "Interpreter","tex");
        xlabel("X (m)");
        ylabel("Y (m)");
        fontsize(gca,14,"points");
        xlim([lim(1) lim(3)]);
        ylim([lim(2) lim(4)]);
        hold off
        pause(simUpdate);
        simTime = simTime + dt;
    end