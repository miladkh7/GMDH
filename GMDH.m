function gmdh=GMDH(PSD,X,Y)
    PSD=[PSD 1];
    maxLayers=numel(PSD);
    layers=cell(maxLayers,1);
    %initialize
    for j=1:length(X(1,:))
       currentNoron(j).value=X(:,j); %#ok 
    end

%     j=1;
    for n=1:numel(PSD)
    %     maxNoron=numberOfNeronInLayers(n)
    %     maxNoron=maxNoron*(maxNoron-1)/2

    %gozine haye entekhab ro besaz
        mergedList=FindMergeIndex(numel(currentNoron));
        % #Sholud bayaad tedad noronahi ke sahte misharo amade onam
        %noron hasho besaz
        for j=1:size(mergedList,1)
            mm=mergedList(j,1);
            nn=mergedList(j,2);
            [ Norons(j).value, Norons(j).Err,Norons(j).path]=CreatNewNeron(currentNoron(mm).value,currentNoron(nn).value,Y,[mm,nn]);%only for test
        end

        %moratab kon
        [~ ,sortorder]=sort([Norons.Err]);
        Norons=Norons(sortorder);

        %ezafe hasho hazf kon
        Norons((PSD(n)+1):end)=[];

        % bebareshon be seri bad
        currentNoron=Norons;
        layers{n}=currentNoron;
        % display state
        disp(['min Error = ' num2str(Norons(1).Err)]);
    %   plot(currentNoron(1).value)

    end
    gmdh.Layers=layers;
%      mergedList=FindMergeIndex(numel(currentNoron));
%     [ Noronsss.value, Noronsss.Err]=CreatNewNeron(currentNoron(mergedList(1)).value,currentNoron(mergedList(2)).value,Y);



end


