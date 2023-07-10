function [dciLogRntiCell2,dciLogRntiCell3,dciLogRntiCell4,dciLogRntiCell5] = func_basic_extractDciWRntiSecondary(ueRnti,dciLogCell2,...
            dciLogCell3,dciLogCell4,dciLogCell5)
dciLogRntiCell2 = [];
dciLogRntiCell3 = [];
dciLogRntiCell4 = [];
dciLogRntiCell5 = [];

if nargin <= 1
    error('Not enough number of input!\n');
end

if nargin >= 2
    dciLogRntiCell2 = dci_extractDCIwRNTI(dciLogCell2, ueRnti);
end

if nargin >= 3
    dciLogRntiCell3 = dci_extractDCIwRNTI(dciLogCell3, ueRnti);
end

if nargin >= 4
    dciLogRntiCell4 = dci_extractDCIwRNTI(dciLogCell4, ueRnti);
end

if nargin >= 5
    dciLogRntiCell5 = dci_extractDCIwRNTI(dciLogCell5, ueRnti);
end

end