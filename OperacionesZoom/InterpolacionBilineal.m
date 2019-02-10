clc, clear, close all;

ima = (rgb2gray(imread('C:\Users\Propietario\Desktop\Sistemas de Visión Artificial\Tareas\OperacionesZoom\Squirtle.bmp')));
im = double(ima);
[filas, columnas] = size((im));
zoom = 2;
for i=1:filas
    for j=1:columnas
         iz = zoom*i;
         jz = zoom*j;
         if iz == zoom*filas || jz == zoom*columnas
             break;
         elseif iz == 2 || jz == 2 
             aumentada(iz,jz)        =   im(i,j);
             aumentada(iz-1,jz-1)    =   im(i,j);
             aumentada(iz-1,jz)      =   im(i,j);
             aumentada(iz-1,jz+1)    =   im(i,j);
             aumentada(iz,jz+1)      =   im(i,j);
             aumentada(iz+1,jz+1)    =   im(i,j);
             aumentada(iz+1,jz)      =   im(i,j);
             aumentada(iz+1,jz-1)    =   im(i,j);
             aumentada(iz,jz-1)      =   im(i,j);
         else
            aumentada(iz, jz)      = mean(im(i,j));
            aumentada(iz, jz+1)    = mean([im(i,j) im(i,j+1)]);
            aumentada(iz+1, jz)    = mean([im(i,j) im(i+1,j)]);
            aumentada(iz+1,jz+1)   = mean([im(i,j) im(i,j+1) im(i+1,j) im(i+1,j+1)]);
         end
    end
end
imzoom = uint8(aumentada);
figure, imshow(uint8(im));
figure, imshow(imzoom);