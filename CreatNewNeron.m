function [y_prime,a_star,err,path]=CreatNewNeron(vector_x1,vector_x2,vector_target,path)
    A=VolterraSeries(vector_x1,vector_x2);
%     [yy,errr]=NeronError(A,vector_target);
    a_star=pinv(A)*vector_target;
    y_prime=A*a_star;
    err=sqrt(mean((vector_target-y_prime).^2));
%     err=sqrt(err);
%     err=errr;
%     y=yy;

end


% 
% function [y_prime, err ]=NeronError(A,y)
% %     a_star=((A')*A)^(-1)*(A')*y;
%       a_star=pinv(A)*y;
% %       a_star=A\y;
%     y_prime=A*a_star;
% %     err=sum((y-y_prime).^2);
%     err=mean((y-y_prime).^2);
%     err=sqrt(err);
% end



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

