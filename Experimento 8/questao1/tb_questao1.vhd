-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 16/04/2021

-- Implementação de um contador modulo 100 com saida BCD, com reset e load sincronos
-- utilizando 2 contadores de modulo 10

-- ******************************************************
-- Testbench para simulação funcional do
--  Circuito: Contador modulo 100 com saida BCD
--                clk             Entrada 1
--                reset           Entrada 2
--                enable          Entrada 3 (ativo baixo)
--                load            Entrada 4
--                dezload         Entrada 5
--                uniload         Entrada 6
--                cont_dezena     Saida 1
--                cont_unidade    Saida 2
-- ******************************************************

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
 
architecture tb_questao1_arch of tb_questao1 is
 
-- Declaracao do componente contador100, referente a sua arquitetura descrita no arquivo questao1.vhd
 
 component contador100 is
    port (
        clk, reset, enable, load: in std_logic;
        dezload, uniload :in std_logic_vector(3 downto 0);
        cont_dezena, cont_unidade: out std_logic_vector(3 downto 0)
    );
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

    signal clk  :std_logic := '0';
    signal reset, enable, load :std_logic;
    signal dezload, uniload :std_logic_vector(3 downto 0);

-- Instancia do componente contador100 e interconexao do componente ao processo de estimulo

begin
    u0: contador100 PORT MAP (clk, reset, enable, load, dezload, uniload, open, open);

-- Implementação do clock   
 clk <= not clk after 5 ms;

 -- Implementacao do processo de estimulo
 estimulo: process
    begin  
        load <= '1'; dezload <= "0010"; uniload <= "1000";
        wait for 10 ms;

        enable <= '0'; load <= '0';
        wait for 130 ms;

        reset <= '1';
        wait for 10 ms;
        reset <= '0';
        wait for 20 ms;

        enable <= '1';
        wait for 10 ms;
        enable <= '0';
        wait;
-- Fim do processo de estimulo
    end process;

--Fim da definiçao da arquitetura
END;

