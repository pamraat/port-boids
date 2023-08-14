function v = flockingVelocity(pos, pRobots, vel, vRobots, a, b, c)
    closeInd = sum((pRobots - pos).^2, 2).^0.5 < 10;
    v1 = sum(pRobots)/size(pRobots, 1) - pos;
    v2 = sum(pos - pRobots(closeInd, :));
    v3 = sum(vRobots)/size(vRobots, 1) - vel;
    v = vel + a*v1 + b*v2 + c*v3;
    v = 10*v./sum(v.^2, 2)^0.5;
end