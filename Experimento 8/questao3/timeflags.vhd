-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 23/04/2021

-- Implementação do sistema que verifica se já se passaram 5 segundos (T5), 6 segundos (T6), 20 segundos (T20), 60 segundos (T60)

-- ******************************************************
--  Circuito: Verificador de tempo
--                cont_dezena     Entrada 1
--                cont_unidade    Entrada 2
--                T5              Saida 1
--                T6              Saida 2
--                T20             Saida 3
--                T60             Saida 4
-- ******************************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity timeflags is
    port(
        cont_dezena, cont_unidade :in std_logic_vector(3 downto 0);
        T5, T6, T20, T60 :out std_logic
    );
end timeflags;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture timeflags_arch of timeflags is

-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

signal contador: std_logic_vector(7 downto 0);


begin
    contador <= cont_dezena & cont_unidade;

    T5 <= '1' when contador >= x"05" else '0';
    T6 <= '1' when contador >= x"06" else '0';
    T20 <= '1' when contador >= x"20" else '0';
    T60 <= '1' when contador >= x"60" else '0';

end timeflags_arch; 
-- a definicao termina por end



