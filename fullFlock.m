function pRobots = fullFlock(rob, sets)
    [~, idx] = ismember(rob, sets, 'rows');
    sets(idx, :) = [];
    pRobots = sets(:, 1:2);
end