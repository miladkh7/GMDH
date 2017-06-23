function gmdh=GMDH(PSD,X,Y)
    PSD=[PSD 1];
    maxLayers=numel(PSD);
    layers=cell(maxLayers,1);
    p=.4;%% darsad teste error ha roye traing
    %Shufle
    suffleList=randperm(length(X));
    X=X(suffleList,:);
    Y=Y(suffleList,:);
    %daste bandi
    
    nTrain=ceil(.9*length(X));
    X_train=X(1:nTrain,:);
    Y_train=Y(1:nTrain,:);
    X_test=X(nTrain+1:end,:);
    Y_test=Y(nTrain+1:end,:);
    %initialize
    
     currentNoron=repmat(struct('value',0,'test',0),length(X_train(1,:)),1);
    for j=1:length(X_train(1,:))
       currentNoron(j).value=X_train(:,j); 
       currentNoron(j).test=X_test(:,j);
    end
    for n=1:numel(PSD)
    %     maxNoron=numberOfNeronInLayers(n)
    %     maxNoron=maxNoron*(maxNoron-1)/2
        %gozine haye entekhab ro besaz
        mergedList=FindMergeIndex(numel(currentNoron));
          %#ISUE: vaghti repmat mikonam poresh nemikone:(
%         Norons=repmat(struct('value',[],'test',[],'Coff',[], 'Err',0,'path',[]),numel(mergedList),1);
        for j=1:size(mergedList,1)
            mm=mergedList(j,1);
            nn=mergedList(j,2);
            [ Norons(j).value,Norons(j).Coff, Err_train,Norons(j).path]=CreatNewNeron(currentNoron(mm).value,currentNoron(nn).value,Y_train,[mm,nn]);  %#ok
            [ Norons(j).test,~, Err_test,~]=CreatNewNeron(currentNoron(mm).test,currentNoron(nn).test,Y_test,[mm,nn]); %#ok
            Norons(j).Err=p*abs(Err_train)+(1-p)*abs(Err_test); %#ok
        end

        %sorting mechanism
        [~ ,sortorder]=sort([Norons.Err]);
        Norons=Norons(sortorder);

        %ezafe hasho hazf kon
        Norons((PSD(n)+1):end)=[];

        % bebareshon be seri bad
        currentNoron=Norons;
        layers{n}=currentNoron;
        % display state
        disp(['min Error in Layer ' num2str(n) ' is neron '  num2str(j) ' = ' num2str(Norons(1).Err)]);
    end
    gmdh.Layers=layers;
    gmdh.suffleList_train=suffleList(1:nTrain);
    gmdh.suffleList_test=suffleList(nTrain:end);
    gmdh.nTrain=nTrain;
    gmdh.nSamle=length(X);
    gmdh.nParameter=size(X,2);

end


