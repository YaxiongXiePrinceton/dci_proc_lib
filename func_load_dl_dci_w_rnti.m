function dci_dl_stat = func_load_dl_dci_w_rnti(filename, rnti)
tbs_idx1 		= 7;
tbs_idx2 		= 10;


if(exist(filename,'file'))
	dci_dl_stat.dci_dl_raw 	    = load(filename1);
	dci_dl_stat.dci_dl 		    = dci_unwrapTTI(dci_dl_raw);
	dci_dl_stat.tti_min  	    = dci_dl_stat.dci_dl(1,1);
	dci_dl_stat.tti_max 	    = dci_dl_stat.dci_dl(end,1);
	dci_dl_stat.tbl 		    = basic_countElementFrequency(dci_dl_stat.dci_dl(:,2));

	dci_dl_stat.dci_ue_dl 		= dci_extractDCIwRNTI(dci_dl_stat.dci_dl,rnti);

	dci_dl_stat.ue_dl_stat 	    = func_dci_ue_stat(dci_ue_dl);    

    dci_dl_stat.ue_tti_min  	= dci_dl_stat.dci_ue_dl(1,1);
    dci_dl_stat.ue_tti_max  	= dci_dl_stat.dci_ue_dl(end,1);
    dci_dl_stat.tbs_all 	    = sum(dci_dl_stat.dci_ue_dl(:,tbs_idx1)) + sum(dci_dl_stat.dci_ue_dl(:,tbs_idx2));
	[~, dci_dl_stat.dci_dl_reTx] 	= dci_find_dl_reTx(dci_dl_stat.dci_ue_dl);

    if~isempty(dci_dl_stat.dci_ue_dl)
        dci_dl_stat.ue_delay_min       = dci_ue_dl(1,12);
    end
else
    dci_dl_stat = struct([]);
end
end