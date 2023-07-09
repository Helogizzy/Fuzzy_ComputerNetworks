function TesteRedes()
    % Exemplifica a utilizacao dos modelos fuzzy criados pelo FIS
    % dentro de codigo Matlab

    % Le o modelo fuzzy criado com o FIS
    Modelo = readfis('redes.fis');

    % entrando com os valores de entrada para nº conexões,
    % tamanho dos pacotes e a frequência de transmissão
    continua = 's';

    while (continua == 's')
        conexoes = input('Informe o numero de conexoes: >> ');
        pacotes = input('Qual o tamanho do pacote? >> ');
        transmissao = input('Qual a taxa de transmissao? >> ');

        % avaliação
        risco = evalfis(Modelo, [conexoes, pacotes, transmissao]);

        fprintf('\nRisco na Rede (probabilidade):');
        disp(risco);
        
        % categorização
        categoria = "";

        if(risco < 37)
            categoria = "baixo";
        elseif(risco < 67)
            categoria = "medio";
        else 
            categoria = "alto";
        end

        fprintf("Categoria do risco: %s\n\n", categoria);

        continua = input('continua ? (s/n): ','s');
    end
end
