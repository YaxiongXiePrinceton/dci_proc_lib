function dciLog_cell = dci_groupCellLog(dciLog1, dciLog2, dciLog3, dciLog4)
dciLog1 = dci_unwrapTTI(dciLog1);
dciLog2 = dci_unwrapTTI(dciLog2);
dciLog_cell = [dciLog1;dciLog2];
if nargin >= 3
    dciLog3 = dci_unwrapTTI(dciLog3);
    dciLog_cell = [dciLog_cell;dciLog3];
end
if nargin >= 4
    dciLog4 = dci_unwrapTTI(dciLog4);
    dciLog_cell = [dciLog_cell;dciLog4];
end
dciLog_cell = sortrows(dciLog_cell);