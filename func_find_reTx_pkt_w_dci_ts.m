function start_idx = func_find_reTx_pkt_w_dci_ts(recv_t_us, oneway_ms, time_s)

reTx_pkt_idx        = knnsearch(recv_t_us, time_s);
start_idx           = check_burst_start(recv_t_us, oneway_ms, reTx_pkt_idx);

if(start_idx ~= reTx_pkt_idx)
    disp("Chanaged idx");
end
end

function start = is_burst_start(recv_t_us, oneway_ms, idx)
    start = 0;
    if(idx == 1)
        start = 1;
        return;
    end
    time_dif = abs(recv_t_us(idx,1)-recv_t_us(idx-1,1));
%     fprintf('time diff: %d \n',time_dif);
    if  time_dif > 6000
%         fprintf("Yes!\n")
        start = 1;        
    end
end

function start_idx = check_burst_start(recv_t_us, oneway_ms, idx)
    nof_pkt = length(recv_t_us);
    start_idx = idx;
    WIND = 14;
    if(idx <= WIND)
        for i=idx:-1:1
            is_start = is_burst_start(recv_t_us,oneway_ms,i);
            if( is_start == 1)
                start_idx = i;
                return;
            end
        end
    else
        for i=idx:-1:idx-WIND
            is_start = is_burst_start(recv_t_us,oneway_ms,i);
            fprintf('%d ', i);
            if( is_start == 1)
                fprintf('we found it: %d\n',i);
                start_idx = i;
                return;
            end
        end
        fprintf('\n');
    end
%     fprintf("no match\n");

end