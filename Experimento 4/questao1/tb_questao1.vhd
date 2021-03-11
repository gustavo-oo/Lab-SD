-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 12/03/2021

-- Implementação das funções booleanas X = A'.B'.C'+ A.B'.C' + A.B e Y = A'.B'+ A'.B.C' + A.B.C utilizando
-- 2 multiplexadores como component

-- ****************************************** 
-- Testbench para simulação funcional do
--  Circuito: 2 funções booleanas de 3 entrada: 
--                A Entrada 1
--                B Entrada 2
--                C Entrada 3
--                X Saida 1 
--                Y Saida 2
-- ******************************************

-- entity (Entidade)
-- tb_questao1 uma entidade sem pinos de entrada e saida

entity tb_questao1 is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

-- Architecture (Arquitetura)
 
architecture testbench of tb_questao1 is
 
-- Declaracao do componente questao1, referente a sua arquitetura descrita no arquivo questao1.vhd
 
 component questao1 is
    port (
        A   :in std_logic;
        B   :in std_logic;
        C   :in std_logic;
        X   :out std_logic;
        Y   :out std_logic
    );
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

  signal s  : std_logic_vector(2 downto 0);
  
-- Instancia do componente questao1 e interconexao do componente ao processo de estimulo

begin
    u1: questao1 PORT MAP (
        A => s(2),
        B => s(1),
        C => s(0), 
        X => open, 
        Y => open
    );

-- Implementacao do processo de estimulo

 estimulo: process
    begin  
        for i in 0 to 7 loop
            wait for 5 ns; 
            s <= std_logic_vector(to_unsigned(i, 3));
        end loop;
        wait;
-- Fim do processo de estimulo

 end process;

--Fim da definiçao da arquitetura

END;
