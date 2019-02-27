function [ PP ] = ImagenHu( ruta )

%Este programa obtiene los 7 momentos invariantes de la imagen asociada a
%la ruta
k = 1;
im = imread(ruta);                  %Lectura de imagen
gris = double(rgb2gray(im));        %Conversion a escala de grises
[filas, columnas] = size(gris);     %Dimensionamiento de la matriz gris

%Algoritmo de binarizacion de imagen. 
for i =1: filas
    for j=1: columnas
        if (gris(i,j) <= 240)
            bin(i,j) = 1;
        else
            bin(i,j) = 0;
        end
    end
end

%Formacion de matrices respecto al dimensionamiento de la imagen inicial
[Y,X] = meshgrid(1:filas,1:columnas);

% Calculo de los 7 momentos de HU
for i=1:4
    for j=1:4
         m(i,j) = PrimerMomento(X,Y,bin,i-1,j-1);
    end
end
         xc = m(2,1)/m(1,1);
         yc = m(1,2)/m(1,1);
for i=1:4
    for j=1:4
        u(i,j) = MomentoCentral(X,Y,bin,i-1,j-1,xc,yc);
        n(i,j) = MomentoNormalizado(u(i,j),u(1,1),i-1,j-1);
    end
end

cero = 1;
uno = 2;
dos = 3;
tres = 4;

%%Invariantes de Hu
phi(k,1)= n(dos,cero)+n(cero,dos);
phi(k,2)= (n(dos,cero) - n(cero,dos)).^2 + 4*n(uno,uno).^2;
phi(k,3)= (n(tres,cero) - 3*n(uno,dos)).^2 + (3*n(dos,uno) - n(cero,tres)).^2;
phi(k,4)= (n(tres,cero) + n(uno,dos)).^2 + (n(dos,uno) + n(cero,tres)).^2;
phi(k,5) = (n(tres,cero) - 3*n(uno,dos))*(n(tres,cero) + n(uno,dos))*((n(tres,cero) + n(uno,dos)).^2 - 3*(n(dos,uno) + n(cero,tres)).^2)...
    + (3*n(dos,uno) - n(cero,tres))*(n(dos,uno) ...
    + n(cero,tres))*(3*(n(tres,cero) + n(uno,dos)).^2 - (n(dos,uno)+n(cero,tres).^2));
phi(k,6) = (n(dos,cero) - n(cero,dos))*((n(tres,cero) + n(uno,dos)).^2 - (n(dos,uno) + n(cero,tres)).^2)...
    + 4*n(uno,uno)*((n(tres,cero) + n(uno,dos))*(n(dos,uno) + n(cero,tres)));
phi(k,7) = (3*n(dos,uno) - n(cero,tres))*(n(tres,cero) + n(uno,dos))*((n(tres,cero) + n(uno,dos)).^2 - 3*(n(dos,uno) + n(cero,tres)).^2)...
    + (3*n(uno,dos) - n(tres,cero)*(n(dos,uno) + n(cero,tres)))*(3*(n(tres,cero) + n(uno,dos)).^2 - (n(dos,uno) + n(cero,tres).^2));


% sec0 = phi((k*0)+1:k*1,1:7);
% sec1 = phi(k+1:k*2,1:7);
% sec2 = phi((k*2)+1:k*3,1:7);
% sec3 = phi((k*3)+1:k*4,1:7);
% sec4 = phi((k*4)+1:k*5,1:7);

PP = phi';

end

