%%% secend try
% CopyRight By Milad khaleghi 2017 guilan university
%%
clc;clear;close all;
%% DataSetes
[x,t] = bodyfat_dataset;
if size(x,1) <size(x,2);x=x';t=t';end

%% GMDH parametes
PSD=[8 4 3 2];% Number max allowed neron in each layer
validateCof=.20;
%% Modeling
nSamples=length(x(:,1));
nValition=ceil(validateCof*nSamples);
nTrain=nSamples-nValition;
Perm = randperm(nSamples);
trainIndex = Perm(1:nTrain);
validationIndex=Perm(nTrain+1:end);
resultTrain=GMDH(PSD,x(trainIndex,:),t(trainIndex,:));
validationVector=ApplyGMDH(resultTrain,x(validationIndex,:));
orginalVector=t(validationIndex,:);
%% Resultes 
% plot(t) 
% grid on
% hold on
% plot(resultTrain.Layers{end}.value)
PlotGMDH(resultTrain)