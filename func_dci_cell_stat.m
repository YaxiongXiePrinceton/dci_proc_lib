function stat = func_dci_cell_stat(dci)
if isempty(dci)
	stat.tti_min  	= 0;
	stat.tti_max 	= 0;
	stat.tbl 		= 0;
else
	stat.tti_min  	= dci(1,1);
	stat.tti_max 	= dci(end,1);
	stat.tbl 		= basic_countElementFrequency(dci(:,2));
end
end
