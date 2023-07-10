function dci_all = func_dci_union_according_tti(dci1, dci2)
    tti1 = dci1(:,1);
    tti2 = dci2(:,1);
    
    % tti in tti2 but not in tti1
    [C, idx]   = setdiff(tti2, tti1);
    missing_dci = dci2(idx,:);

    dci_all = [dci1; missing_dci];
    dci_all = sortrows(dci_all);

end