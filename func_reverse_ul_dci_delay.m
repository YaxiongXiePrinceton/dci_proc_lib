function oneway_ms = func_reverse_ul_dci_delay(oneway_ms, idx, delay_base, tbs)
[len1, ~]  = size(oneway_ms);
pkt_size = 0;
while pkt_size < tbs
    oneway_ms(idx,1) = delay_base;
    idx         = idx + 1;
    pkt_size    = pkt_size + 60 * 8;    
    if idx > len1
        break;
    end
end
end