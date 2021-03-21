-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 26/03/2021

-- Implementação de um flip-flop JK gatilhado na borda de subida do clock.

-- ****************************************** 
-- Testbench para simulação funcional do
--  Circuito: Flip-Flop JK:
--                pr  Entrada 1
--                clr Entrada 2
--                clk Entrada 3
--                J   Entrada 4
--                K   Entrada 5
--                Q   Saida
-- ******************************************

-- entity (Entidade)
-- tb_flipflopJK uma entidade sem pinos de entrada e saida

entity tb_flipflopJK is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

-- Architecture (Arquitetura)
 
architecture tb_flipflopJK_arch of tb_flipflopJK is
 
-- Declaracao do componente flipflopJK, referente a sua arquitetura descrita no arquivo flipflopJK.vhd
 
 component flipflopJK is
    port (
        pr, clr, clk, J, K :in std_logic;
        Q : out std_logic
    );
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

  signal s  : std_logic_vector(1 downto 0);
  signal clk : std_logic := '0';
  signal jk :std_logic_vector(1 downto 0);
  
-- Instancia do componente flipflopJK e interconexao do componente ao processo de estimulo

begin
    u1: flipflopJK PORT MAP (pr => s(1), clr => s(0), J => jk(1), K => jk(0), clk => clk, Q => open);

-- Implementacao do processo de estimulo
 clk <= not clk after 5 ns;

 estimulo: process
    begin  
        for i in 0 to 4 loop
            s <= std_logic_vector(to_unsigned(i, 2));
            jk <= "00";
            wait for 10 ns;
            jk <= "01";
            wait for 10 ns;
            jk <= "11";
            wait for 10 ns;
            jk <= "10";
            wait for 10 ns;
        end loop;
        wait;
-- Fim do processo de estimulo

 end process;

--Fim da definiçao da arquitetura

END;

