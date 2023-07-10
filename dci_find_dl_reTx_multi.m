function dci_reTx = dci_find_dl_reTx_multi(varargin)
dci_reTx = [];

for i = 1:1:nargin
    [~, dci_reTx_raw] = dci_find_dl_reTx(varargin{1});
    dci_reTx    = [dci_reTx; dci_reTx_raw];
end

end