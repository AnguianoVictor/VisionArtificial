function [ mpq ] = PrimerMomento( X,Y,F,p,q )
%X : Matriz
%Y : Matriz
%F : Matriz
%p : Escalar
%q : Escalar

mpq= sum(sum((X.^p).*(Y.^q).*F));


end

