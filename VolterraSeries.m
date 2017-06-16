function Y = VolterraSeries(x1,x2)
%VolterraSeries Summary of this function goes here
%   Detailed explanation goes here
%  x1(:,1)
%  x2(:,1)
%  Y=0
 
% Y=[ 1 x1(:,1); x2(:,1); x1(:,1).^2; x2(:,1).^2; x1(:,1).*x2(:,1)];
y1=ones(1,numel(x1));
y2=x1(:,1)';
y3=x2(:,1)';
y4= x1(:,1).^2';
y5=x2(:,1).^2';
y6=(x1(:,1).*x2(:,1))';
Y =[y1;y2;y3;y4;y5;y6]';
end

