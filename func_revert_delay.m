function oneway_ms = func_revert_delay(varargin)
% Input: dci from multiple cells dci_1 dci_2 ... pkt_recv_t_us oneway_ms
if nargin < 3
    fprintf("Error: the number of input doesn't match the function!");
    return;
end

pkt_recv_t_us   = varargin{end - 1};
oneway_ms       = varargin{end};

dci_reTx    = [];

for i = 1:1:(nargin-2)
    dci_ue      = varargin{i};
    ue_stat 	= func_dci_ue_stat(dci_ue);
    dci_reTx    = [dci_reTx;ue_stat.dci_dl_reTx];
end

dci_reTx            = sortrows(dci_reTx,1);
minDistance         = 7.5; % Need to be closer than this to be in the same cluster.
minPointsPerCluster = 1; % A cluster must have at least 2 points to be a valid cluster.
indexes             = dbscan(dci_reTx(:,1), minDistance, minPointsPerCluster);
reTx_idx_tti        = [dci_reTx(:,1), indexes];
reTx_cluster        = func_cluster_reTx(reTx_idx_tti);
[len1, ~]        = size(reTx_cluster);


for i = 1:1:len1      
    cluster = reTx_cluster(i,:);
    tbs_all = basic_get_reTx_data(cluster, dci_ue);
    tti     = cluster(1,1); % starting point of tti

    for j = 1:1:(nargin-2)
        dci_ue      = varargin{j};
        [tti_idx, cell_idx, dci_tti] = basic_find_tti_across_cell(dci_ue, tti);
        if(~isempty(dci_tti) && tti_idx ~= -1 && cell_idx ~= -1)
            break;
        end
    end

    if(isempty(dci_tti) || tti_idx == -1 || cell_idx == -1)
        fprintf("ERROR: cannot find TTI inside the DCI\n");
        continue;
    end

    reTx_pkt_idx        = knnsearch(pkt_recv_t_us, dci_tti(:,12));
    range = 30;
    if(reTx_pkt_idx == 1)
        delay_base          = oneway_ms(1,1);
    elseif(reTx_pkt_idx <= 30)
%         delay_base          = mean(oneway_ms(1:reTx_pkt_idx-1,1));
        delay_base          = min(oneway_ms(1:reTx_pkt_idx-1,1));
    else
%         delay_base          = mean(oneway_ms(reTx_pkt_idx-range:reTx_pkt_idx-1,1));
        delay_base          = min(oneway_ms(reTx_pkt_idx-range:reTx_pkt_idx-1,1));
    end
    oneway_ms           = func_reverse_dci_delay(oneway_ms, reTx_pkt_idx, delay_base, tbs_all);
end

end