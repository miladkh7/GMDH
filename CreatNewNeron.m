function [y,err]=CreatNewNeron(vector_x1,vector_x2,vector_target)
    A=VolterraSeries(vector_x1,vector_x2);
    [yy,errr]=NeronError(A,vector_target);
    err=errr;
    y=yy;
end