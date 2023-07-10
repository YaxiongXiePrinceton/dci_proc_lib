function [idx, dci_reTx] = dci_find_dl_reTx_NDI(dci)
if(isempty(dci))
    idx = [];
    dci_reTx = [];
else
    rv_idx1 	= 6;
    rv_idx2 	= 9;
    rv 			= dci(:, rv_idx1) + dci(:, rv_idx2);
    idx 		= find(rv > 0);
    dci_reTx 	= dci(idx,:);
end
end


