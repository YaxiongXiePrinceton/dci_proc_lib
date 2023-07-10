function dciLog = dci_unwrapTTI(dciLog)
    tti     = dciLog(:,1);
    tti_dif = diff(tti);
    idx = find(abs(tti_dif) > 9000);
    for i=1:1:length(idx)
        dciLog(idx(i,1)+1:end,1) = dciLog(idx(i,1)+1:end,1) + 10240;
    end
    
    
end