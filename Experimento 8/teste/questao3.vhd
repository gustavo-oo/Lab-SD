-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 23/04/2021

-- Implementação de um semáforo utilizando uma máquina de estados de Mealy

-- ******************************************************
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

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity questao3 is 
    port (
        clk, ligadesliga, sensorA, sensorB: in std_logic;
        cont_dezena, cont_unidade: out std_logic_vector(3 downto 0);
        semaforoA, semaforoB : out std_logic_vector(2 downto 0)
    );
end questao3;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture questao3_arch of questao3 is
-- Declaracao do componente MaqEstados, referente a sua arquitetura descrita no arquivo maqestados.vhd
 
    component MaqEstados is 
        port (
            clk, ligadesliga, sensorA, sensorB, T5, T6, T20, T60 :in std_logic;
            semaforoA, semaforoB :out std_logic_vector(2 downto 0);
            resetcounter :out std_logic
        );
    end component;

-- Declaracao do componente questao2, referente a sua arquitetura descrita no arquivo questao2.vhd

    component questao2 is 
    port (
        clk, reset : in std_logic;
        cont_dezena, cont_unidade :out std_logic_vector(3 downto 0);
        T5, T6, T20, T60: out std_logic
    );
    end component;

-- Sinal auxiliares para a interconexao ao
-- processo de estimulo

signal T5, T6, T20, T60, resetcounter: std_logic;

begin
-- Instancias dos componentes e interconexao dos mesmos:
    u0: MaqEstados PORT MAP (clk, ligadesliga, sensorA, sensorB, T5, T6, T20, T60, semaforoA, semaforoB, resetcounter);
    u1: questao2 PORT MAP (clk, resetcounter, cont_dezena, cont_unidade, T5, T6, T20, T60);

end questao3_arch; 
-- a definicao termina por end


