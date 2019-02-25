function [ upq ] = MomentoCentral( X,Y,F,p,q,xc,yc )
%X : Matriz
%Y : Matriz
%F : Matriz
%p : Escalar
%q : Escalar

upq= sum(sum(((X-xc).^p).*((Y-yc).^q).*F));

end