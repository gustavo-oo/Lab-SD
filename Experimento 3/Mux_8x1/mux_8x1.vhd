-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 05/03/2021

-- Implementação de um Multiplexador 8x1 (8 entradas de dados, 1 saída e 1 seletor de 3 bits)

-- ****************************************** 
--  Circuito: Multiplexador de 2 entradas: 
--                D Entrada 
--                S Seletor
--                Y  Saida
-- ******************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;

--Entity (Entidade)
--pinos de entrada e saída

entity mux_8x1 is 
    port (
        D   :in std_logic_vector(7 downto 0); 
        S   :in std_logic_vector(2 downto 0); 
        Y   :out std_logic
    );
end mux_8x1;


--Architecture (Arquitetura)
--implementacoes do projeto

architecture mux of mux_8x1 is
 
-- a definicao inicia por 
begin

-- Y = f(D, S)    
    Y <= D(0) when (S = "000") else
        D(1) when (S = "001") else
        D(2) when (S = "010") else
        D(3) when (S = "011") else
        D(4) when (S = "100") else
        D(5) when (S = "101") else
        D(6) when (S = "110") else
        D(7) when (S = "111");

end mux; 

-- a definicao termina por end

