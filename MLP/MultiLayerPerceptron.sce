clear;
clc;

base = fscanfMat('aerogerador.dat');

q = 10; //Neurônios ocultos

x = base(:,1);

d = base(:,2);
[p N] = size(x); // p é o tamanho do vetor e N é a quantidade de amostras

cont=0;

for i=1:N
x_teste = x(i,:);
d_teste=d(i,:);
x_treino=x; x_treino(i,:) = [];
d_treino=x; d_treino(i,:) = [];
    
x_treino = [(-1)*ones(1,N-1);x_treino];

w = rand(q,p-1,'normal');

u_treino = w*x_treino;

z_treino = 1./(1+exp(-u_treino));

z_treino=[(-1)*ones(1,N-1);z_treino];

m = d*z_treino'/(z_treino*z_treino');

//---------------TESTE--------------------

u_teste = w*[-1;x_teste]

z_teste = 1./(1+exp(-u_teste));

z_teste = [-1;z_teste];


saida = m*z_teste;

[a b] = max(d_teste);
[c d] = max(saida);

if b==d
    cont = cont+1
end

disp(saida);

end

disp(cont/N);
