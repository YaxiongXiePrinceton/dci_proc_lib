function dciOut = func_basic_extractDciAccording2Sfn(fnStart, fnEnd, dciLog)
idx = find(dciLog(:,1) == fnStart);
if ~isempty(idx)
    idxStart = idx(1,1);
else
    error("Cannot find starting sfn in the dci log!\n");
end

idx = find(dciLog(:,1) == fnEnd);
if ~isempty(idx)
    idxEnd = idx(1,1);
else
    error("Cannot find starting sfn in the dci log!\n");
end

dciOut = dciLog(idxStart:idxEnd,:);
end