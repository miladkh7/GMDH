% % function [y_prime, err ]=NeronError(A,y)
% % %     a_star=((A')*A)^(-1)*(A')*y;
% %       a_star=pinv(A)*y;
% % %       a_star=A\y;
% %     y_prime=A*a_star;
% % %     err=sum((y-y_prime).^2);
% %     err=mean((y-y_prime).^2);
% %     err=sqrt(err);
% % end
