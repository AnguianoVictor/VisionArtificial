function [ npq ] = MomentoNormalizado( upq,u00,p,q )
%X : Matriz
%Y : Matriz
%F : Matriz
%p : Escalar
%q : Escalar

sumpq = p+q;
if sumpq >= 2
    delta = ((p+q)/2)+1;
else
    delta = 1;
end

npq= upq/(u00^delta);

end
