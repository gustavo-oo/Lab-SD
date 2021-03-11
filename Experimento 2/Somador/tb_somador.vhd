-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves
-- Data : 26/02/2021

-- Testbench da Implementação de um Somador Completo com 3 bits de entrada e 2 de saída, descrito por duas funções lógicas

-- ****************************************** 
--  Testbench para a simulacao Funcional do
--  Circuito: Somador de 3 entradas: 
--                A Entrada 1
--                B Entrada 2
--                Cin Entrada 3
--                S Saida 1
--                Cout  Saida2
-- ******************************************

-- entity (Entidade)
-- testbench1 uma entidade sem pinos de entrada e saida

entity testbench1 is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;


-- Architecture (Arquitetura)
 
architecture tb_somador of testbench1 is
 
-- Declaracao do componente somador, referente a sua arquitetura descrita no arquivo somador.vhd
 
 component SOMADOR is
 port(
    A      :in std_logic; 
    B      :in std_logic; 
    Cin    :in std_logic; 
    S      :out std_logic; 
    Cout   :out std_logic 
);
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

    signal a  : std_logic;
    signal b   : std_logic;
    signal cin : std_logic;
 
-- Instancia do componente somador e interconexao do componente ao processo de estimulo

begin
    somador1: SOMADOR PORT MAP (A => a, B => b, Cin => cin, S => open, Cout => open);

-- Implementacao do processo de estimulo

 estimulo: process
    begin  

    wait for 5 ns; a <= '0'; b <= '0'; cin <= '0';
    wait for 5 ns; cin <= '1';
    wait for 5 ns; b <= '1';
    wait for 5 ns; cin <= '0';
    wait for 5 ns; a <= '1';
    wait for 5 ns; cin <= '1';
    wait for 5 ns; b <= '0';
    wait for 5 ns; cin <= '0';
    wait;
 
-- Fim do processo de estimulo

 end process;

--Fim da definiçao da arquitetura

END;
