function [model, requiredRxns] = specify_required_rxns(model, metList)

coaMets = {'accoa[m]'; 'succoa[m]'; 'pmtcoa[c]'};
[model, addedRxns] = addDemandReaction(model, ...
    setdiff(metList, coaMets));

% The following are not simple demand reactions, so must be added
% separately as normal reactions.
model = addReaction(model, 'DM_accoa(m)', {'accoa[m]'; 'coa[m]'}, ...
    [-1; 1], 0, 0, 1000, 0);
model = addReaction(model, 'DM_succoa(m)', {'succoa[m]'; 'coa[m]'}, ...
    [-1; 1], 0, 0, 1000, 0);
model = addReaction(model, 'DM_pmtcoa(c)', {'pmtcoa[c]'; 'coa[c]'}, ...
    [-1; 1], 0, 0, 1000, 0);
requiredRxns = [addedRxns, 'DM_accoa(m)', 'DM_succoa(m)', 'DM_pmtcoa(c)']';
