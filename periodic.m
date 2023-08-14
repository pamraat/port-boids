function pos = periodic(pos, lim)
    pos(pos(:, 1) > lim(3), 1) = rem(pos(pos(:, 1) > lim(3), 1) - lim(1), lim(3) - lim(1)) + lim(1);
    pos(pos(:, 2) > lim(4), 2) = rem(pos(pos(:, 2) > lim(4), 2) - lim(2), lim(4) - lim(2)) + lim(2);
    pos(pos(:, 1) < lim(1), 1) = rem(pos(pos(:, 1) < lim(1), 1) - lim(3), lim(1) - lim(3)) + lim(3);
    pos(pos(:, 2) < lim(2), 2) = rem(pos(pos(:, 2) < lim(2), 2) - lim(4), lim(2) - lim(4)) + lim(4);
end