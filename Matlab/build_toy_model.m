
%% Load Recon 1
load('HR1_CbModel')

%% Define random list of reactions from the model
rng(0) % set the seed to enable reproduciblity
rand_idx = randperm(length(model.rxns), 500);