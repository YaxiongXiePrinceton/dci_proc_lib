function tbs_all = basic_get_reTx_data(reTx_cluster, dci)
tbs_idx1    = 7;
tbs_idx2    = 10;
idx         = (dci(:,1) >= reTx_cluster(1,1) - 8) & (dci(:,1) < reTx_cluster(1,2)) & (dci(:,6) == 0)  & (dci(:,9) == 0);
tbs_all     = sum(dci(idx,tbs_idx1) + dci(idx,tbs_idx2));
end