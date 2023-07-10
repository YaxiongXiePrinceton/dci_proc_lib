function reTx_cluster = func_cluster_reTx(reTx)
reTx_cluster = [];

if(~isempty(reTx))
    nof_cluster  = reTx(end,2);
    reTx_cluster = zeros(nof_cluster,2);    
    
    for i=1:1:nof_cluster
        vec     = reTx(reTx(:,2) == i,:);
        reTx_cluster(i,1)   = vec(1,1);
        reTx_cluster(i,2)   = vec(end,1);
    end
end
end