-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 05/03/2021

-- Implementação de um Multiplexador 8x1 (8 entradas de dados, 1 saída e 1 seletor de 3 bits)

-- ****************************************** 
-- Testbench para simulação funcional do
--  Circuito: Multiplexador de 2 entradas: 
--                D Entrada 
--                S Seletor
--                Y  Saida
-- ******************************************

-- entity (Entidade)
-- tb_mux_8x1 uma entidade sem pinos de entrada e saida

entity tb_mux_8x1 is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;


-- Architecture (Arquitetura)
 
architecture testbench of tb_mux_8x1 is
 
-- Declaracao do componente mux_8x1, referente a sua arquitetura descrita no arquivo mux_8x1.vhd
 
 component mux_8x1 is
    port(
        D   :in std_logic_vector(7   downto 0); 
        S   :in std_logic_vector(2 downto 0); 
        Y   :out std_logic 
    );
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

  signal d  : std_logic_vector(7 downto 0);
  signal s  : std_logic_vector(2 downto 0);
 
-- Instancia do componente mux_8x1 e interconexao do componente ao processo de estimulo

begin
    mux: mux_8x1 PORT MAP (D => d, S => s, Y => open);

-- Implementacao do processo de estimulo

 estimulo: process
    begin  

    wait for 5 ns; d <= "10110101"; s <= "000";
    wait for 5 ns; s <= "001";
    wait for 5 ns; s <= "010";
    wait for 5 ns; s <= "011";
    wait for 5 ns; s <= "100";
    wait for 5 ns; s <= "101";
    wait for 5 ns; s <= "110";
    wait for 5 ns; s <= "111";
    wait;
 
-- Fim do processo de estimulo

 end process;

--Fim da definiçao da arquitetura

END;
