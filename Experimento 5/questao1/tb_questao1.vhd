-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 19/03/2021

-- Implementação de um somador de palavras de 4 bits utilizando somadores completos

-- ****************************************** 
-- Testbench para simulação funcional do
--  Circuito: Somador de palavras de 4 bits:
--                A Entrada 1
--                B Entrada 2
--                S Saida
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
        A   :in std_logic_vector(3 downto 0);
        B   :in std_logic_vector(3 downto 0);
        S   :out std_logic_vector(4 downto 0)
    );
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

  signal s  : std_logic_vector(7 downto 0);
  
-- Instancia do componente questao1 e interconexao do componente ao processo de estimulo

begin
    u1: questao1 PORT MAP (
        A => s(3 downto 0),
        B => s(7 downto 4),
        S => open
    );

-- Implementacao do processo de estimulo

 estimulo: process
    begin  
        for i in 255 downto 0 loop
            wait for 5 ns; 
            s <= std_logic_vector(to_unsigned(i, 8));
        end loop;
        wait;
-- Fim do processo de estimulo

 end process;

--Fim da definiçao da arquitetura

END;
