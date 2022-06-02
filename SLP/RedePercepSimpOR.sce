clear;
clc;

//OR

dados = [-1 0 0 0
         -1 0 1 1
         -1 1 0 1
         -1 1 1 1];
         
w = [];

for i= 1:3
    w(i) = rand();
end
ponteiro = 1;
//----------------------
for i=1:40
    x = dados(ponteiro, 1:3);
    tar = dados(ponteiro,4);
    //Somatória
    net = x*w;
    
    if net >= 0 then
        net = 1;
    else 
        net = 0;
    end
    
    erro = tar-net
    
    for i = 1:3
        w(i) = w(i)+0.6*erro*x(i);
    end
    
    ponteiro = ponteiro + 1;
    
    if ponteiro>4 then
        ponteiro = 1;
    end
    disp('---------------')
    disp('Entrada');
    disp(x);
    disp('---------------')
    disp('Alvo');
    disp(tar);
    disp('---------------')
    disp('Net');
    disp(net);
end
