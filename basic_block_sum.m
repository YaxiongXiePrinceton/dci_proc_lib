function ret = basic_block_sum(idxValArray,len)
%% block_sum calculate the block sum of the matrix
%  Input idxValArray -- index and value array [index, value]
%        index is contineous [index(min):index(max)] -- each value reprensents 1ms 
%        len -- sum length
%  Output: Matrix of summed value [index, val_sum]
if len < 1
    error('Sum length cannot be smaller than 1');
end

[lenRow, ~] = size(idxValArray);
eleNo = ceil(lenRow / len);

newArray = zeros(eleNo * len ,2);   % Create a new array
newArray(1:lenRow,:) = idxValArray;

newArrayReshape     = reshape(newArray(:,2),len,[]);
ret1     = sum(newArrayReshape,1);
ret2     = idxValArray(1,1):len:idxValArray(end,1);

if length(ret1)~= length(ret2)
    error('Length not equal: basic_block_sum');
end
ret = [ret2',ret1'];
end