function output1=ApplyGMDH(inputGMDH,X)
    
    %for each layer calculate output value
    output=X;
    for i=1:numel(inputGMDH.Layers)
      output=CalculateLayerOutput(inputGMDH.Layers{i},output);
    end
    output1=output;
end

function y=CalculateLayerOutput(L,X)
    m = size(X,1);
    N = numel(L);
    y = zeros(m,N);
    for i=1:numel(L)
        A=VolterraSeries(X(:,L(i).path(1)),X(:,L(i).path(2)));
        y(:,i) = A*L(i).Coff;
    end
end
function Y = VolterraSeries(x1,x2)
    y1=ones(1,numel(x1));
    y2=x1(:,1)';
    y3=x2(:,1)';
    y4= x1(:,1).^2';
    y5=x2(:,1).^2';
    y6=(x1(:,1).*x2(:,1))';
    Y =[y1;y2;y3;y4;y5;y6]';
end
