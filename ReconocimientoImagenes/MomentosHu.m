clc, clear, close all;

%5 imagenes por pokemon. 

num_im = 25;
for k=1: num_im
im = imread(strcat('.\Modelos\',num2str(k),'.bmp'));
gris = double(rgb2gray(im));
[filas, columnas] = size(gris);

for i =1: filas
    for j=1: columnas
        if (gris(i,j) <= 240)
            bin(i,j) = 1;
        else
            bin(i,j) = 0;
        end
    end
end

[Y,X] = meshgrid(1:filas,1:columnas);

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
end

P = phi';

save invariantes P