function [shift_v, knn_dist_all] = func_find_delay_shift(dci_reTx, pkt_reTx, shift_vec)

knn_dist_all = zeros(size(shift_vec));
shift_cnt = 0;
for shift = shift_vec
    [~, knn_dist] = knnsearch(dci_reTx+shift, pkt_reTx);
    shift_cnt = shift_cnt + 1;
    knn_dist_all(1,shift_cnt) = sum(knn_dist);
end
[~, i] = min(knn_dist_all);

shift_v = shift_vec(1,i);
end