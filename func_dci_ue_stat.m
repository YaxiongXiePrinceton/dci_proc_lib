function stat = func_dci_ue_stat(dci)

tbs_idx1 		= 7;
tbs_idx2 		= 10;

if isempty(dci)
	stat.tti_min  	= 0;
	stat.tti_max 	= 0;
	stat.tbs_all 	= 0;
	stat.dci_dl_reTx 	= [];
else
	stat.tti_min  	= dci(1,1);
	stat.tti_max 	= dci(end,1);
	stat.tbs_all 	= sum(dci(:,tbs_idx1)) + sum(dci(:,tbs_idx2));
    stat.tbs_all_Mb	= sum(dci(:,tbs_idx1)) + sum(dci(:,tbs_idx2)) ./ 10^6;
	[idx, stat.dci_dl_reTx] 	= dci_find_dl_reTx(dci);
end
end
