function pRobots = pGroups(p, rob, sets)
    [~, id] = ismember(rob, sets, 'rows');
    idx = rem(id, p);
    idx = idx:p:size(sets, 1);
    idx(idx == id) = []; idx(idx == 0) = [];
    pRobots = sets(idx, 1:2);
end