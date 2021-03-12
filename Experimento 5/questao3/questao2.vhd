-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 19/03/2021

-- Implementação de um somador de palavras de 4 bits utilizando o operador '+'

-- ****************************************** 
--  Circuito: Somador de palavras de 4 bits:
--                A Entrada 1
--                B Entrada 2
--                S Saida
-- ******************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;

--Entity (Entidade)
--pinos de entrada e saída

entity questao2 is 
    port (
        A   :in std_logic_vector(3 downto 0);
        B   :in std_logic_vector(3 downto 0);
        S   :out std_logic_vector(4 downto 0)
    );
end questao2;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture rtl of questao2 is

-- a definicao inicia por 
begin

-- S = f(A, B)
    S <= unsigned('0' & A) + unsigned('0' & B);
    
end rtl; 
-- a definicao termina por end
