-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 26/03/2021

-- Implementação de um registrador de deslocamento bidirecional de 4 bits gatilhado pela borda de subida do clock.

-- ******************************************************
-- Testbench para simulação funcional do
--  Circuito: Registrador de desclocamento bidirecional:
--                clk   Entrada 1
--                rst   Entrada 2
--                load  Entrada 3
--                dir   Entrada 4
--                D     Entrada 5
--                L     Entrada 6
--                R     Entrada 7
--                Q     Saida
-- ******************************************************

-- entity (Entidade)
-- tb_reg_bi uma entidade sem pinos de entrada e saida

entity tb_reg_bi is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

-- Architecture (Arquitetura)
 
architecture tb_reg_bi_arch of tb_reg_bi is
 
-- Declaracao do componente reg_bi, referente a sua arquitetura descrita no arquivo reg_bi.vhd
 
 component reg_bi is
    port (
        clk, rst, load, dir, L, R :in std_logic;
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0)
    );
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

  signal clk : std_logic := '0';
  signal rst, load, dir : std_logic;
  signal LR : std_logic_vector(1 downto 0);
  signal d : std_logic_vector(3 downto 0);
  
-- Instancia do componente reg_bi e interconexao do componente ao processo de estimulo

begin
    u0: reg_bi port map (clk, rst, load, dir, LR(1), LR(0), D, Q => open);

-- Implementacao do processo de estimulo
 clk <= not clk after 5 ns;

 estimulo: process
    begin  
        D <= "1010"; rst <= '1'; load <= '1';
        wait for 10 ns;
        rst <= '0';
        wait for 10 ns;

        dir <= '0'; load <= '0';
        for i in 0 to 3 loop
            LR <= std_logic_vector(to_unsigned(i, 2));
            wait for 10 ns;
        end loop;

        dir <= '1';
        for i in 0 to 3 loop
            LR <= std_logic_vector(to_unsigned(i, 2));
            wait for 10 ns;
        end loop;

        rst <= '1';
        wait;
-- Fim do processo de estimulo
 end process;

--Fim da definiçao da arquitetura
END;