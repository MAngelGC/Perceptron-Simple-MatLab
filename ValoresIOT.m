function [Input,Output,Target] = ValoresIOT(Data,W,i)
    sz = width(Data); % Obtenemos las dimensiones de la matriz
    Input = [Data(i,1:sz-1) -1]; % El input será la fila que nos pasen en el argumento, y todas las columnas menos la última, 
    % añadiendo una columna de -1 al final para que coincida con las dimensiones del vector de pesos
    Output = Signo(Input * W); % Se calcula la salida aplicando la función signo al producto de la entrada y el vector de pesos
    Target = Data(i,sz); % El target será la última columna de esa fila.
end