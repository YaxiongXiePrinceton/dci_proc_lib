function ret = basic_accum_idx_val(index, val)
%% accum_idx_val: calculate the total value for each index
%  OUTPUT: matrix -- 1st column index(min):1:index(max)   
%  OUTPUT: matrix -- 2nd column sum of val with the same index
if length(index) ~= length(val)
    error('Index length != value length')
end

idxMin = min(index);
idxMax = max(index);
if idxMin < 0
    error('Index cannot be negative');
elseif idxMin == 0
    idxMin = 1;
end

accRet      = accumarray(index,val);
accRetCut   = accRet(idxMin:end,1);
idxArray    = idxMin:1:idxMax;

ret         = [idxArray',accRetCut];

