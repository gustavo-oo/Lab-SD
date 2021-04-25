-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 23/04/2021

-- Implementação de um semáforo utilizando uma máquina de estados de Mealy

-- ******************************************************
-- Testbench para simulação funcional do
--  Circuito: Semáforo utilizando máquina de estados de MEaly:
--              clk           Entrada 1
--              ligadesliga   Entrada 2
--              sensorA       Entrada 3
--              sensorB       Entrada 4
--              cont_dezena   Entrada 5
--              cont_unidade  Entrada 6
--              semaforoA     Saida 1
--              semaforoB     Saida 2
-- ******************************************************

-- entity (Entidade)
-- tb_questao2 uma entidade sem pinos de entrada e saida

entity tb_questao3 is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

-- Architecture (Arquitetura)
 
architecture tb_questao3_arch of tb_questao3 is
 
-- Declaracao do componente questao3, referente a sua arquitetura descrita no arquivo questao3.vhd

    component questao3 is 
    port (
        clk, ligadesliga, sensorA, sensorB: in std_logic;
        cont_dezena, cont_unidade: out std_logic_vector(3 downto 0);
        semaforoA, semaforoB : out std_logic_vector(2 downto 0)
    );
    end component;
    
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

    signal clk  :std_logic := '1';
    signal ligadesliga, sensorA, sensorB :std_logic;

-- Instancia do componente contador100 e interconexao do componente ao processo de estimulo

begin
    u0: questao3 PORT MAP (clk, ligadesliga, sensorA, sensorB, open, open, open, open);

-- Implementação do clock   
 clk <= not clk after 0.5 sec;

 -- Implementacao do processo de estimulo
 estimulo: process
    begin  
        ligadesliga <= '1';
        sensorA <= '1'; sensorB <= '1';
        wait for 30 sec;

        ligadesliga <= '0';
        wait for 10 sec;

        ligadesliga <= '1';
        sensorB <= '0';
        wait for 30 sec;

        sensorA <= '0';
        wait for 60 sec;

        wait;
-- Fim do processo de estimulo
    end process;

--Fim da definiçao da arquitetura
END;



