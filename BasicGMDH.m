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
numberOfAllowedNeron=[20 20 20 20 20 10 5 4 3 2];% Number max allowed neron in each layer
testCof=.15;
validateCof=.15;
%%
nSamples=length(x(:,1));
nElement=length(x(1,:));
nValition=ceil(validateCof*nSamples);
nTest=ceil(testCof*nSamples);
nTrain=nSamples-nValition-nTest;

%% initial
% mergedList=FindMergeIndex(length(x(1,:)))
for j=1:length(x(1,:))
   currentNoron(j).value=x(:,j); %#ok %only for test
end

j=1;
for n=1:numel(numberOfAllowedNeron)
%     maxNoron=numberOfNeronInLayers(n)
%     maxNoron=maxNoron*(maxNoron-1)/2

%gozine haye entekhab ro besaz
    mergedList=FindMergeIndex(numel(currentNoron));
    % #Sholud bayaad tedad noronahi ke sahte misharo amade onam
    %noron hasho besaz
    for j=1:size(mergedList,1)
        mm=mergedList(j,1);
        nn=mergedList(j,2);
        [ Norons(j).value, Norons(j).Err]=CreatNewNeron(currentNoron(mm).value,currentNoron(nn).value,t);%only for test
    end

    %moratab kon
    [~ ,sortorder]=sort([Norons.Err]);
    Norons=Norons(sortorder);

    %ezafe hasho hazf kon
    Norons((numberOfAllowedNeron(n)+1):end)=[];
   
    % bebareshon be seri bad
    currentNoron=Norons;
    disp('salam')
end
 mergedList=FindMergeIndex(numel(currentNoron));
[ Noronsss.value, Noronsss.Err]=CreatNewNeron(currentNoron(mergedList(1)).value,currentNoron(mergedList(2)).value,t)
