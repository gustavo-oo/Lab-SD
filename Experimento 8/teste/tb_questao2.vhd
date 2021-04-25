-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 16/04/2021

-- Implementação do sistema de temporizacao do controle de semaforos indicando
-- que já se passaram 5 segundos (T5), 6 segundos (T6), 20 segundos (T20), 60 segundos (T60)

-- ******************************************************
-- Testbench para simulação funcional do
--  Circuito: Temporizador do semaforo
--                clk             Entrada 1
--                reset           Entrada 2
--                T5              Saida 1
--                T6              Saida 2
--                T20             Saida 3
--                T60             Saida 4
--                cont_dezena     Saida 5
--                cont_unidade    Saida 6
-- ******************************************************

-- entity (Entidade)
-- tb_questao2 uma entidade sem pinos de entrada e saida

entity tb_questao2 is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

-- Architecture (Arquitetura)
 
architecture tb_questao2_arch of tb_questao2 is
 
-- Declaracao do componente questao2, referente a sua arquitetura descrita no arquivo questao2.vhd

    component questao2 is 
        port (
            clk, reset : in std_logic;
            cont_dezena, cont_unidade :out std_logic_vector(3 downto 0);
            T5, T6, T20, T60: out std_logic
        );
    end component;
    
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

    signal clk  :std_logic := '1';
    signal reset :std_logic;
    signal cont_dezena, cont_unidade :std_logic_vector(3 downto 0);

-- Instancia do componente contador100 e interconexao do componente ao processo de estimulo

begin
    u0: questao2 PORT MAP (clk, reset, cont_dezena, cont_unidade, open, open, open, open);

-- Implementação do clock   
 clk <= not clk after 5 ms;

 -- Implementacao do processo de estimulo
 estimulo: process
    begin  
        reset <= '0';
        wait for 115 ms;
        reset <= '1';
        wait for 10 ms;
        reset <= '0';
        wait;
-- Fim do processo de estimulo
    end process;

--Fim da definiçao da arquitetura
END;


