function layers2=StringDecoding(layout_Code)
    nLayer=log2(length(layout_Code));
    layers=cell(nLayer,1);
    layers2=cell(nLayer,1);
    noronLenght=length(layout_Code);
    for activeLayer=1:nLayer
        nNoronInLayer=length(layout_Code)/noronLenght;
        Noron=repmat(struct('Code',[]),nNoronInLayer,1); 
        startIndex=1;
%          currentLayer=layers{activeLayer};
        for j=1:nNoronInLayer
           stopIndex=startIndex+noronLenght-1;
           Noron(j).Code= layout_Code(startIndex:stopIndex);
           startIndex=stopIndex+1;
        end
        layers{nLayer-activeLayer+1}=Noron;
        noronLenght=noronLenght/2;
    end

    %% delet tekrari
    for activeLayer=1:nLayer
        length(layers{activeLayer}(1).Code);
        allInlayer=[];
        for i=1:numel(layers{activeLayer})
            term=layers{activeLayer}(i).Code;
%             interm=term(end:-1:1);
            allInlayer=[allInlayer ;term]; %#ok
        end
        allInlayer=unique(allInlayer, 'rows');
        sNoron=repmat(struct('Code',[]),size(allInlayer,1),1); 
        for j=1:size(allInlayer,1)
           sNoron(j).Code= allInlayer(j,:);
        end
        layers2{activeLayer}= sNoron;
        clear allInlayer sNoron;
    end



end