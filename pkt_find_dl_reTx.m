function [idx, log_reTx] = pkt_find_dl_reTx(log)
delay_thd_ms 	= 7;  % 7 ms 
time_dif    = [0;diff(log(:,5))];
idx         = find(time_dif > delay_thd_ms);
log_reTx    = log(idx,:);
end
