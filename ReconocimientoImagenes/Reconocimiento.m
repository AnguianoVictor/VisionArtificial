clc, clear, close all;

% Reconocimiento de imagenes a traves de una red neuronal Competitiva

load('invariantes.mat')                 %Lectura de momentos invariantes de las 25 imagenes de entrenamiento creados por el script MomentosHu.m
[NE, NP] = size(P);                     %Se obtiene el numero de elementos, en este caso 7 momentos invariantes
                                        %NP se refiere al numero de
                                        %entradas, en este caso 25, que
                                        %corresponden a las 25 imagenes de
                                        %entrenamiento
for i=1:NP
    W(:,i) = P(:,i)./norm(P(:,i));      %Normalizar los vectores de entrada para convertir en vectores unitarios
                                        %y guardarlos como los pesos
                                        %sinapticos
end

imagenPrueba = '.\Comprobacion\Mew.bmp';
PP = ImagenHu(imagenPrueba);%Aqui se coloca la ruta de la imagen a reconocer
PP=PP./norm(PP);                        %Se normalizan los momentos invariantes de la imagen a reconocer

% Se colocan como parametros los pesos sinapticos y la imagen a reconcoer
% en el comando compet, que corresponde a una red neuronal competitiva
a = compet(W'*PP);
[Y,I] = max(a);                         %Se obtiene el valor máximo que correspondera a 
                                        %la neurona que se activo. 

% Valores de las neuronas asociadas a cada imagen reconocida. 
B = [1,6,11,16,21];
C = [2,7,12,17,22];
S = [3,8,13,18,23];
M = [4,9,14,19,24];
MT= [5,10,15,20,25];

%Interpretacion 
for j = 1:NP/5
    if I == B(j)
        salida = 'Bulbasur';
    end
    if I == C(j)
        salida = 'Charmander';
    end
    if I == S(j)
        salida = 'Squirtle';
    end
    if I == M(j)
        salida = 'Meow';
    end
    if I == MT(j)
        salida = 'Meowtwo';
    end
end

disp(['La imagen reconocida corresponde a un ', salida]);
imshow(imread(imagenPrueba));
title(salida)