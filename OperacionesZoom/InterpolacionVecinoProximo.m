%%Nucleo de interpolacion: Vecino más proximo.

%p(i,j) valor de un pixel de la imagen original en la posicion i,j
%pz(x,y) valor del pixel imagen resultante de la interpolacion a partir de p(i,j)
%h(x,y) Nucleo de interpolacion. 

% clc, clear, close all
% 
% %Lectura de imagen y conversión a escala de grises. 
% im = rgb2gray((imread('C:\Users\Propietario\Desktop\Sistemas de Visión Artificial\Tareas\OperacionesZoom\Squirtle.bmp')));
% 
% %Obtención de tamaño de la imagen. 
% [filas, columnas] = size(im);
% [x,y] = meshgrid(1:columnas, 1:filas);
% %Valor del zoom.
% zoom = 2;
% [p,q] = meshgrid(1:zoom:columnas, 1:zoom:filas);
% I2 = interp2(x, y, im, p, q, 'nearest');
% 
% figure, imshow(im)
% figure, imshow(I2)





clc, clear, close all;

im = rgb2gray(imread('C:\Users\Propietario\Desktop\Sistemas de Visión Artificial\Tareas\OperacionesZoom\Squirtle.bmp'));
[filas, columnas] = size(im);
zoom = 2;

for i=1:(filas)
    for j=1:(columnas)
        iz = zoom*i;
        jz = zoom*j;
        if iz == 2*filas || jz == 2*columnas
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
                    aumentada(iz,jz)        =   im(i,j);
                    aumentada(iz+1,jz+1)    =   im(i,j);
                    aumentada(iz,jz+1)      =   im(i,j);
                    aumentada(iz+1,jz)      =   im(i,j);
        end
    end
end

figure, imshow(im)
figure,imshow(aumentada)




