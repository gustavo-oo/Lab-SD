-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 05/03/2021

-- Implementação de um Decodificador de 4 para 16 bits (1 vetor de 4 bits de entrada e 1 vetor de 16 bits de saida)

-- ****************************************** 
--  Circuito: Decodificador de 1 entrada: 
--                A Entrada
--                Y  Saida
-- ******************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;

--Entity (Entidade)
--pinos de entrada e saída

entity decod_4x16 is 
    port (
        A   :in std_logic_vector(3 downto 0);  
        Y   :out std_logic_vector(15 downto 0)
    );
end decod_4x16;


--Architecture (Arquitetura)
--implementacoes do projeto

architecture decod of decod_4x16 is
 
-- a definicao inicia por 
begin

-- Y = f(A)    
    with A select
        Y <= "0000000000000001" when "0000",
             "0000000000000010" when "0001",
             "0000000000000100" when "0010",
             "0000000000001000" when "0011",
             "0000000000010000" when "0100",
             "0000000000100000" when "0101",
             "0000000001000000" when "0110",
             "0000000010000000" when "0111",
             "0000000100000000" when "1000",
             "0000001000000000" when "1001",
             "0000010000000000" when "1010",
             "0000100000000000" when "1011",
             "0001000000000000" when "1100",
             "0010000000000000" when "1101",
             "0100000000000000" when "1110",
             "1000000000000000" when "1111",
             "0000000000000000" when others;
end decod; 

-- a definicao termina por end

