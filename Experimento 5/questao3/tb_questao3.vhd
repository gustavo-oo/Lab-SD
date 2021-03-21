-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 19/03/2021

-- Testbench que compara o dut (questão 1) com o golden module (questão 2)

-- ****************************************** 
-- Testbench para validação do
--  Circuito: Somador de palavras de 4 bits:
--                A Entrada 1
--                B Entrada 2
--                S Saida
-- ******************************************

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity tb_questao3 is 
    port (
        A   :out std_logic_vector(3 downto 0);
        B   :out std_logic_vector(3 downto 0);
        dut :in std_logic_vector(4 downto 0);
        gm  :in std_logic_vector(4 downto 0)
    );
end tb_questao3;

-- Architecture (Arquitetura)
 
architecture testbench_arch of tb_questao3 is
 
-- Sinal auxiliar para a interconexao ao
-- processo de estimulo

begin

-- Implementacao do processo de estimulo

 process
    begin  
        report "Iniciando  teste ..."  severity  NOTE;
        for i in 0 to 16 loop 
            A <= std_logic_vector(to_unsigned(i, 4));
            for j in 0 to 16 loop
                B <= std_logic_vector(to_unsigned(j, 4));
                wait for 500 ns;

                assert(dut = gm) report "Teste Falhou" severity ERROR;
            end loop;
        end loop;
        report "Teste  finalizado !"  severity  NOTE;
        wait;
-- Fim do processo de estimulo

 end process;

--Fim da definiçao da arquitetura
END;

