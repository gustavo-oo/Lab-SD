-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 12/03/2021

-- Implementação das função booleana: S = F.G + A.B.C.D.E'.F'.G + A'.B'.C'.D'.E'.F'.G + A.B'.C.E.F.G' +
--                                       A'.B.C.D.E'.F.G' + A.B.C.D.E.F'.G' + A.B'.C'.D.E.F'.G',
-- utilizando um decodificador de 4 para 16 bits e um multiplexador de 8 bits de entrada.

-- ****************************************** 
-- Testbench para simulação funcional do
--  Circuito: 1 função booleana de 7 entradas: 
--                A Entrada 1
--                B Entrada 2
--                C Entrada 3
--                D Entrada 4
--                E Entrada 5
--                F Entrada 6
--                G Entrada 7
--                S Saida
-- ******************************************

entity tb_questao2 is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

-- Architecture (Arquitetura)
 
architecture testbench of tb_questao2 is
 
-- Declaracao do componente questao2, referente a sua arquitetura descrita no arquivo questao2.vhd
 
 component questao2 is
    port (
    A, B, C, D, E, F, G :in std_logic;
    S :out std_logic
    ); 
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

  signal s  : std_logic_vector(6 downto 0);
  
 
-- Instancia do componente questao1 e interconexao do componente ao processo de estimulo

begin
    u1: questao2 PORT MAP (
        A => s(6),
        B => s(5),
        C => s(4),
        D => s(3),
        E => s(2),
        F => s(1),
        G => s(0),
        S => open
    );

-- Implementacao do processo de estimulo

 estimulo: process
    begin  
        for i in 0 to 127 loop
            wait for 5 ns; 
            s <= std_logic_vector(to_unsigned(i, 7));
        end loop;
        wait;
-- Fim do processo de estimulo

 end process;

--Fim da definiçao da arquitetura

END;


