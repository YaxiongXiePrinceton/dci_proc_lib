function tbl_dl = basic_countElementFrequency(vec)
%% count the frequency of each element in a vector 
%  Input: vector
%  Output: [rnti, frequency, ratio]
tbl_dl          = tabulate(vec);    

index           = tbl_dl(:,2) == 0;         
tbl_dl(index,:) = [];

% RNTI is not zero
index           = tbl_dl(:,1) == 0;         
tbl_dl(index,:) = [];

tbl_dl          = sortrows(tbl_dl,2,'descend'); 
end