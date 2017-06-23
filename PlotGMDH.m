

function layout=PlotGMDH(inputGMDH)
%    close all;
    [layout, maxi,nParameter]=GMDHLayout(inputGMDH);
    figure;
    PlotLayout(layout,maxi,nParameter)
end

function PlotLayout(layout,maxi,nParameter)
    h=nParameter;
    dyVectorPrime=[];
    myColor=colormap(prism);
    grid on
    set(gca, 'XTickLabel', []);
    set(gca, 'YTickLabel', []);
    hold on
    
    for f=1:numel(layout)
%           disp(['Layer ' num2str(layout(f).NOlayer)  ' Noron ' num2str(layout(f).NOnoron) ' path [ ' num2str(layout(f).family) ' ]'])
        dy=h/(maxi(layout(f).NOlayer)+1);
        dyVector=dy*(1:maxi(layout(f).NOlayer));%bordar jaygasht haye mojaz
        % prime 
        if numel(dyVectorPrime)==0;dyVectorPrime=dyVector;end
        %Parent indecies
        index1=layout(f).family(1);
        index2=layout(f).family(2);
        y_p1=index1;
        y_p2=index2;
        
        % #hint: y_p at frist is index;
        if layout(f).NOlayer ~=1
            y_p1=layout(y_p1).Cordinate(2);
            y_p2=layout(y_p2).Cordinate(2);
        end
        y_bar=.5*(y_p1+y_p2);
        [~,yIndex]=min(abs(dyVectorPrime-y_bar));
        bestY=dyVectorPrime(yIndex);
        dyVectorPrime(yIndex)=[]; %#ok
        layout(f).Cordinate=[layout(f).NOlayer+1,bestY];
        lineColor=myColor(randi([1,63]),:);
%         lineColor=rand([1,3]);
               
        if layout(f).NOlayer ~=1
            line([layout(f).Cordinate(1),layout(index1).Cordinate(1)],[layout(f).Cordinate(2),y_p1],'color',lineColor,'linewidth',1.5)        
            line([layout(f).Cordinate(1),layout(index2).Cordinate(1)],[layout(f).Cordinate(2),y_p2],'color',lineColor,'linewidth',1.5)
        else
            line([layout(f).Cordinate(1),0],[layout(f).Cordinate(2),y_p1],'color',lineColor,'linewidth',1.5)        
            line([layout(f).Cordinate(1),0],[layout(f).Cordinate(2),y_p2],'color',lineColor,'linewidth',1.5)
        end
        %lines
     end
     for f=1:numel(layout)
         plot(layout(f).Cordinate(1),layout(f).Cordinate(2),'o','MarkerSize',11,'markerfacecolor','green')
     end
    plot(0,1:13,'o','MarkerSize',11,'markerfacecolor','red');
    title('Neural Network Diagram')
end

function [layout, maxi,nParameter]=GMDHLayout(inputGMDH)
    nParameter=inputGMDH.nParameter;
    layout=repmat(struct('NO',0,'NOlayer',1,'NOnoron',1,'family',[],'Cordinate',[0;0]),1000,1);
    k=0;
    maxi =[];
    nEx=0;
    for i=1:numel(inputGMDH.Layers)
        activeLayer=inputGMDH.Layers{i};
        if i>2; nEx=nEx+numel(inputGMDH.Layers{i-2});end
        maxi=[maxi numel(activeLayer)]; %#ok
        for j=1:numel(activeLayer)
            activeNoron=activeLayer(j);
            k=k+1;
            layout(k).NO=k;
            layout(k).NOlayer=i;
            layout(k).NOnoron=j;
            layout(k).family=[nEx+activeNoron.path(1);nEx+activeNoron.path(2)];
        end
    end
    layout=layout(1:k);
end

