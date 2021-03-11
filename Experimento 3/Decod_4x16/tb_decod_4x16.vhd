-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 05/03/2021

-- Implementação de um Decodificador de 4 para 16 bits (1 vetor de 4 bits de entrada e 1 vetor de 16 bits de saida)

-- ****************************************** 
-- Testbench para simulação funcional do
--  Circuito: Decodificador de 1 entrada: 
--                A Entrada
--                Y  Saida
-- ******************************************

-- entity (Entidade)
-- tb_decod_4x16 uma entidade sem pinos de entrada e saida

entity tb_decod_4x16 is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;


-- Architecture (Arquitetura)
 
architecture testbench of tb_decod_4x16 is
 
-- Declaracao do componente decod_4x16, referente a sua arquitetura descrita no arquivo decod_4x16.vhd
 
 component decod_4x16 is
    port(
        A   :in std_logic_vector(3   downto 0); 
        Y   :out std_logic_vector(15 downto 0)
    );
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

  signal a  : std_logic_vector(3 downto 0);
 
-- Instancia do componente decod_4x16 e interconexao do componente ao processo de estimulo

begin
    uut: decod_4x16 PORT MAP (A => a, Y => open);

-- Implementacao do processo de estimulo

 estimulo: process
    begin  

    for i in 0 to 15 loop
        wait for 5 ns; 
        a <= std_logic_vector(to_unsigned(i, 4));
    end loop;
    wait;

-- Fim do processo de estimulo

 end process;

--Fim da definiçao da arquitetura

END;
