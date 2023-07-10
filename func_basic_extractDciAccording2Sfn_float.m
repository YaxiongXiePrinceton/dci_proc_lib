function dciOut = func_basic_extractDciAccording2Sfn_float(fnStart, fnEnd, dciLog)
if (dciLog(1,1) > fnEnd) || (dciLog(end,1) < fnStart)
    error('sfn is out of the range of dci log!');
end

[dciLen,~] = size(dciLog);

idx = find(dciLog(:,1) <= fnStart);

if ~isempty(idx)
    idxStart = idx(end,1)+1;
    fprintf("not empty! %d\n",idxStart);
else
    idxStart = 1;
end

idx = find(dciLog(:,1) >= fnEnd);
if ~isempty(idx)
    idxEnd = idx(1,1);
else
    idxEnd = dciLen;
end

dciOut = dciLog(idxStart:idxEnd,:);
end