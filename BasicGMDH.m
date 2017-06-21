%%% frist try
% shabake GMDH 3 laye be ravesh PSD
%%
clc;clear;close all;



%% DataSetes
  [x,t] = bodyfat_dataset;
%   [x,t] = abalone_dataset  ;
x=x';
t=t';
%hanoz bakhshe validation o test ro joda nakardam ke bayad etefagh biofte

%% GMDH parametes
PSD=[10 20 20 10 10 10 10 10 10 10 10 10 10 10 10 2];% Number max allowed neron in each layer
maxLayers=numel(PSD); % bayad montaghel shavad
testCof=.15;
validateCof=.15;
%% Modeling
nSamples=length(x(:,1));
nElement=length(x(1,:));
nValition=ceil(validateCof*nSamples);
nTest=ceil(testCof*nSamples);
nTrain=nSamples-nValition-nTest;
% layers=cell(maxLayers,1);

resultTrain=GMDH(PSD,x,t);

%% Resultes 
plot(t) 
grid on
hold on
plot(resultTrain.Layers{end}.value)