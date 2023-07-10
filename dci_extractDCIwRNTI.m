function dci_log_rnti = dci_extractDCIwRNTI(dciLog, rnti)
%% Extract the dci message for the user with ID rnti
index = dciLog(:,2) == rnti;
dci_log_rnti = dciLog(index,:);
end