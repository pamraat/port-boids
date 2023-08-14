function pRobots = kNN(k, rob, sets)
    [~, idx] = ismember(rob, sets, 'rows');
    sets(idx, :) = [];
    idx = knnsearch(sets,rob,'K',k,'Distance','minkowski','P',2);
    pRobots = sets(idx, 1:2);
end