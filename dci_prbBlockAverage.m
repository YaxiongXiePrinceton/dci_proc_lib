function prbAve = dci_prbBlockAverage(prbArray, aveLen)
%% average the PRB over aveLen subframes
%  OUTPUT: prbAve -- Matrix [index, mean PRB]
prbSum    = basic_block_sum(prbArray,aveLen);
prbAve    = prbSum;
prbAve(:,2)     = prbAve(:,2) ./ aveLen;
end