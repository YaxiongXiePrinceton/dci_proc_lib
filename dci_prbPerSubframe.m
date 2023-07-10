function prbArray = dci_prbPerSubframe(dciLog,prb_idx, MAX_PRB)
%% calculate the total PRB and TBS in each subframe frame
%  INPUT: dciLog the dci log matrix
%  OUTPUT: prbArray -- matrix [index, PRB] index is contineous 1ms 
%  OUTPUT: tbsArray -- matrix [index, TBS] index is contineous 1ms 
fn  = dciLog(:,1);
prb = dciLog(:,prb_idx);
% tbs1= dciLog(:,8);
% tbs2= dciLog(:,9);


prbArray  = basic_accum_idx_val(fn,prb);
idx       = prbArray(:,2) > MAX_PRB;
prbArray(idx,2) = MAX_PRB;

tmp       = MAX_PRB - prbArray(:,2);
idx       = find(tmp == 4);
prbArray(idx,2)     = MAX_PRB;
idx       = find(tmp == 8);
prbArray(idx,2)     = MAX_PRB;
idx       = find(tmp == 12);
prbArray(idx,2)     = MAX_PRB;


end