clear;
clc;
close all;

load DatosAND
%load DatosLS5
%load DatosLS10
%load DatosLS50
%load DatosOR
%load DatosXOR

LR=0.2;
Limites=[-1.5, 2.5, -1.5, 2.5];
MaxEpoc=100;

W=PerceptronWeigthsGenerator(Data);
test = [2 1 -1];
Epoc=1;

tic
while ~CheckPattern(Data,W) && Epoc<MaxEpoc
     for i=1:size(Data,1)
        [Input,Output,Target]=ValoresIOT(Data,W,i);
       
        GrapDatos(Data,Limites);
        GrapPatron(Input,Output,Limites);
        GrapNeuron(W,Limites);hold off;
        drawnow
%         pause;
        
        if Output~=Target
           W=UpdateNet(W,LR,Output,Target,Input);
        end
        
        GrapDatos(Data,Limites);
        GrapPatron(Input,Output,Limites)
        GrapNeuron(W,Limites);hold off;
        drawnow
%         pause;
     
    end
    Epoc=Epoc+1;
end
toc
