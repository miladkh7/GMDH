%%% secend try
% CopyRight By Milad khaleghi 2017 guilan university
%%
clc;clear;close all;
%% DataSetes
[x,t] = bodyfat_dataset;
if size(x,1) <size(x,2);x=x';t=t';end

%% GMDH parametes
PSD=[4 3 2];% Number max allowed neron in each layer
validateCof=.20;
%% Modeling
nSamples=length(x(:,1));
nValition=ceil(validateCof*nSamples);
nTrain=nSamples-nValition;
Perm = randperm(nSamples);
trainIndex = Perm(1:nTrain);
validationIndex=Perm(nTrain+1:end);
trainedGMDH=GMDH(PSD,x(trainIndex,:),t(trainIndex,:));
outputs=ApplyGMDH(trainedGMDH,x(validationIndex,:));
orginalVector=t(validationIndex,:);
%% Resultes 

figure;
PlotGMDH(trainedGMDH)

figure;
PlotResults(t(validationIndex,:), outputs, 'Validation');

figure;
PlotResults(t(trainedGMDH.suffleList_train,:), trainedGMDH.Layers{end}.value, 'Train Data');

