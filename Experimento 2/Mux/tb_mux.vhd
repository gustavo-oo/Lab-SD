-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves
-- Data : 26/02/2021

-- Implementação de um Multiplexador 4x1 (4 entradas de dados, 1 saída e 1 seletor de 2 bits)

-- ****************************************** 
-- Testbench para simulação funcional do
--  Circuito: Multiplexador de 2 entradas: 
--                D Entrada 1
--                S Seletor
--                Y  Saida
-- ******************************************

-- entity (Entidade)
-- testbenchmux uma entidade sem pinos de entrada e saida

entity testbenchmux is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;


-- Architecture (Arquitetura)
 
architecture tb_mux of testbenchmux is
 
-- Declaracao do componente somador, referente a sua arquitetura descrita no arquivo somador.vhd
 
 component mux is
    port(
        D   :in std_logic_vector(3 downto 0); 
        S   :in std_logic_vector(1 downto 0); 
        Y   :out std_logic 
    );
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

  signal d  : std_logic_vector(3 downto 0);
  signal s  : std_logic_vector(1 downto 0);
 
-- Instancia do componente somador e interconexao do componente ao processo de estimulo

begin
    mux1: mux PORT MAP (D => d, S => s, Y => open);

-- Implementacao do processo de estimulo

 estimulo: process
    begin  

    wait for 5 ns; d <= "1010"; s <= "00";
    wait for 5 ns; s <= "01";
    wait for 5 ns; s <= "10";
    wait for 5 ns; s <= "11";
    wait for 5 ns; d <= "0101"; s <= "00";
    wait for 5 ns; s <= "01";
    wait for 5 ns; s <= "10";
    wait for 5 ns; s <= "11";
    wait;
 
-- Fim do processo de estimulo

 end process;

--Fim da definiçao da arquitetura

END;
