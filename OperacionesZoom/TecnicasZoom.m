clc, clear, close all;

im = imread('C:\Users\Propietario\Desktop\Sistemas de Visión Artificial\Tareas\OperacionesZoom\Squirtle.bmp');
gris = rgb2gray(im);
[filas, columnas] = size(gris);
zoom = 2;
rellenox = zeros(filas, columnas);
rellenoy = zeros(filas, columnas);

for i=1:(filas-1)
    for j=1:(columnas-1)
        xf = zoom*i;
        yf = zoom*j;
        rellenox(xf-1, yf-1) = uint8((gris(i,j)+gris(i+1,j))/2);
        rellenoy(xf, yf-1) = uint8((gris(i,j)+gris(i,j+1))/2);
        aumentada(xf, yf) = gris(i,j);
    end
end
 vectorx = zeros(497,1);
 trans = zeros(1,498);
 rellenox = [rellenox vectorx];
 rellenox = [rellenox;trans];
 rellenoy = [rellenoy trans'];
imshow(aumentada)
real = aumentada+uint8(rellenox)+uint8(rellenoy);
figure,imshow(real)
% for i=1:(filas-1)
%     for j=1:(columnas-1)
%         if mod(i,2) == 0 && mod(j,2) == 0
%             xf=i+1;
%             yf=j+1;
%             aumentada(xf, yf) = rellenox(i-1,j-1);
%         else
%             aumentada(xf, yf) = rellenox(i,j);
%         end
%     end
% end




