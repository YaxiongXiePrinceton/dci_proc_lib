% dciLog = load('DCI_dl_log.txt');
dciLog = load('../../dataFolder/TR_/dciTrace/DCI_dl_log_PC1_bbr.txt');

%% Cell
MAX_PRB = 50;
[prbArrayCELL, tbsArrayCELL] = dci_prbTbsPerSubframe(dciLog,MAX_PRB);
prbAveCELL    = dci_prbBlockAverage(prbArrayCELL, 100);
tbsSumCELL    = basic_block_sum(tbsArrayCELL,100);

tMin = prbAveCELL(1,1)./10^3;
tMax = prbAveCELL(end,1)./10^3;


figure(1)
subplot(2,2,1)
plot(prbAveCELL(:,1)./10^3,prbAveCELL(:,2));
xlim([tMin,tMax]);
subplot(2,2,2)
plot(tbsSumCELL(:,1)./10^3,tbsSumCELL(:,2));
xlim([tMin,tMax]);
%% UE 
rnti= dciLog(:,3);
rntiFreq = basic_countElementFrequency(rnti);
dciLogRNTI = dci_extractDCIwRNTI(dciLog, rntiFreq(1,1));

[prbArrayUE, tbsArrayUE] = dci_prbTbsPerSubframe(dciLogRNTI,MAX_PRB);
prbAveUE    = dci_prbBlockAverage(prbArrayUE, 100);
tbsSumUE    = basic_block_sum(tbsArrayUE,100);


subplot(2,2,3)
plot(prbAveUE(:,1)./10^3,prbAveUE(:,2));
xlim([tMin,tMax]);
subplot(2,2,4)
plot(tbsSumUE(:,1)./10^3,tbsSumUE(:,2));
xlim([tMin,tMax]);


dciLog = load('../../dataFolder/TR_/dciTrace/DCI_dl_log_PC2_bbr.txt');

%% Cell
MAX_PRB = 50;
[prbArrayCELL, tbsArrayCELL] = dci_prbTbsPerSubframe(dciLog,MAX_PRB);
prbAveCELL    = dci_prbBlockAverage(prbArrayCELL, 100);
tbsSumCELL    = basic_block_sum(tbsArrayCELL,100);

tMin = prbAveCELL(1,1)./10^3;
tMax = prbAveCELL(end,1)./10^3;

figure(2)
subplot(2,2,1)
plot(prbAveCELL(:,1)./10^3,prbAveCELL(:,2));
xlim([tMin,tMax]);
subplot(2,2,2)
plot(tbsSumCELL(:,1)./10^3,tbsSumCELL(:,2));
xlim([tMin,tMax]);

%% UE 
rnti= dciLog(:,3);
rntiFreq = basic_countElementFrequency(rnti);
dciLogRNTI = dci_extractDCIwRNTI(dciLog, rntiFreq(1,1));

[prbArrayUE, tbsArrayUE] = dci_prbTbsPerSubframe(dciLogRNTI,MAX_PRB);
prbAveUE    = dci_prbBlockAverage(prbArrayUE, 100);
tbsSumUE    = basic_block_sum(tbsArrayUE,100);


subplot(2,2,3)
plot(prbAveUE(:,1)./10^3,prbAveUE(:,2));
xlim([tMin,tMax]);
subplot(2,2,4)
plot(tbsSumUE(:,1)./10^3,tbsSumUE(:,2));
xlim([tMin,tMax]);
%% pantheon

panLog = load('../../dataFolder/TR_/PantheonTrace/bbr_outNet_log.txt');
arrivalTime = panLog(:,1) - panLog(1,1);
oneway     = panLog(:,3);

figure(3)
plot(arrivalTime,oneway);