function [y,err,path]=CreatNewNeron(vector_x1,vector_x2,vector_target,path)
    A=VolterraSeries(vector_x1,vector_x2);
    [yy,errr]=NeronError(A,vector_target);
    err=errr;
    y=yy;
end

function [y_prime, err ]=NeronError(A,y)
%     a_star=((A')*A)^(-1)*(A')*y;
      a_star=pinv(A)*y;
%       a_star=A\y;
    y_prime=A*a_star;
%     err=sum((y-y_prime).^2);
    err=mean((y-y_prime).^2);
    err=sqrt(err);
end
