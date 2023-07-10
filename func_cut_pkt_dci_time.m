function [dci_seg, pkt_seg] = func_cut_pkt_dci_time(dci, pkt,time_win,time_stamp)
% time_win = 500;

dci_idx = find((dci > time_stamp) & (dci < time_stamp+time_win));
dci_seg = dci(dci_idx,:);

pkt_idx = find((pkt > time_stamp) & (pkt < time_stamp+time_win));
pkt_seg = pkt(pkt_idx,:);

end