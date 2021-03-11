-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves
-- Data : 26/02/2021

-- Implementação de um Somador Completo com 3 bits de entrada e 2 de saída, descrito por duas funções lógicas

-- ****************************************** 
--  Circuito: Somador de 3 entradas: 
--                A Entrada 1
--                B Entrada 2
--                Cin Entrada 3
--                S Saida 1
--                Cout  Saida2
-- ******************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;

--Entity (Entidade)
--pinos de entrada e saída

entity SOMADOR is port (

A      :in std_logic; 
B      :in std_logic; 
Cin    :in std_logic; 
S      :out std_logic; 
Cout   :out std_logic );
end SOMADOR;


--Architecture (Arquitetura)i
--implementacoes do projeto

architecture rtl of SOMADOR is
 
-- a definicao inicia por 
begin

-- S = f(A,B,Cin)

S <= A xor B xor Cin;

-- Cout = f(A,B,Cin)

Cout <= (A and B) or (A and Cin) or (B and Cin);


end rtl; 

-- a definicao termina por end