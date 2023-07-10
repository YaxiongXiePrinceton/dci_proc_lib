function [dciLogRntiCell1,rntiFreq,targetRnti] = func_basic_idExtractDciPrimaryCell(dciLogCell1,rntiFreqIdx)
%% identify and extract the dci log of our UE according to the dci measured from primary cell
%  Input: dciLogCell1 -- DCI log of primary cell
%  Input: rntiFreqIdx -- The index of the highest frequency e.g., 1
%  reprensents highest and 2 representes the secondary highest


%%% Count the frequency of each rnti
rnti     = dciLogCell1(:,3);
rntiFreq = basic_countElementFrequency(rnti);
targetRnti  = rntiFreq(rntiFreqIdx,1);


%%%% Extract dci of UE with RNTI
dciLogRntiCell1 = dci_extractDCIwRNTI(dciLogCell1, targetRnti);



end