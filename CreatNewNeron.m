function [y_prime,a_star,err,path]=CreatNewNeron(vector_x1,vector_x2,vector_target,path)
    A=VolterraSeries(vector_x1,vector_x2);
    a_star=pinv(A)*vector_target;
    y_prime=A*a_star;
    err=sqrt(mean((vector_target-y_prime).^2));
end

function Y = VolterraSeries(x1,x2)
%VolterraSeries Summary of this function goes here
%   Detailed explanation goes here
    y1=ones(1,numel(x1));
    y2=x1(:,1)';
    y3=x2(:,1)';
    y4= x1(:,1).^2';
    y5=x2(:,1).^2';
    y6=(x1(:,1).*x2(:,1))';
    Y =[y1;y2;y3;y4;y5;y6]';
end

