function [tti_idx, cell_idx, dci] = basic_find_tti_across_cell(varargin)
if nargin < 2
    printf("Error: the number of input doesn't match the function!");
    return;
end

% search for tti
tti     = varargin{end};
for i = 1:1:(nargin-1)
    dci_ue  = varargin{i};
    idx = find(dci_ue(:,1)== tti, 1);
    if~isempty(idx)
        tti_idx  = idx;
        cell_idx = 1;
        dci      = dci_ue(idx,:);
        return;
    end
end

% we cannot find the tti
tti_idx     = -1;
cell_idx    = -1;
dci         = [];

end

% 
% function [tti_idx, cell_idx, dci] = basic_find_tti_across_cell(dci_ue_dl1, dci_ue_dl2, dci_ue_dl3, tti)
% 
% idx = find(dci_ue_dl1(:,1)== tti, 1);
% if~isempty(idx)
%     tti_idx  = idx;
%     cell_idx = 1;
%     dci      = dci_ue_dl1(idx,:);
% else
%     idx = find(dci_ue_dl2(:,1)== tti, 1);
%     if~isempty(idx)
%         tti_idx  = idx;
%         cell_idx = 2;
%         dci      = dci_ue_dl2(idx,:);
%     else
%         idx = find(dci_ue_dl3(:,1)== tti, 1);
%         if~isempty(idx)
%             tti_idx  = idx;
%             cell_idx = 3;
%             dci      = dci_ue_dl3(idx,:);
%         else
%             tti_idx     = -1;
%             cell_idx    = -1;
%             dci         = [];
%         end
%     end
% end
% end