function [fnStart, fnEnd] = func_basic_extractDciWithinTCP(dciLogRntiCell1,TEST_TIME_MS)

dciLogRntiCell1(1:200,:) = []; %kill the first 100 dci for ssh exchange

fnStart = dciLogRntiCell1(1,1);
fnEnd   = dciLogRntiCell1(end,1);

fnDiff = diff(dciLogRntiCell1(:,1));

% we don't check the first half
[dciLen,~] = size(dciLogRntiCell1);
dciHalfLen = floor(dciLen);
fnDiff(1:dciHalfLen,1) = 0;

% figure(2)
% plot(fnDiff);
idx     = find(fnDiff > 300);
if ~isempty(idx)
    fnTmp       = dciLogRntiCell1(idx(1,1),1);
    activeTime  = fnTmp - fnStart;
    isActiveLongEnough(activeTime, TEST_TIME_MS,fnStart,fnEnd);
    fnEnd       = fnTmp;
else
    activeTime  = fnEnd - fnStart;
    fnEnd = isActiveLongEnough(activeTime, TEST_TIME_MS,fnStart,fnEnd);    
end


end

function fnEnd = isActiveLongEnough(activeTime, TEST_TIME_MS,fnStart,fnEnd)
if (activeTime < 0.9 * TEST_TIME_MS)
    error("UE active time seems not right! --- Too short!\n");    
end
if (activeTime > 1.3 * TEST_TIME_MS) 
    fprintf("UE active time seems not right! --- Too long!\n");   
    fnEnd = fnStart + TEST_TIME_MS;
end
end