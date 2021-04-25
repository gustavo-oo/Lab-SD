-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 16/04/2021

-- Implementação de uma máquina de refrigerantes utilizando uma máquina de estados de Moore

-- ******************************************************
-- Testbench para simulação funcional do
--  Circuito: Máquina de Refrigerante de Moore:
--                clk   Entrada 1
--                reset Entrada 2
--                A     Entrada 3
--                Q     Saida 1 - Moeda de 25 centavos
--                H     Saida 2 - Moeda de 50 centavos
--                R     Saida 3 - Refrigerante
-- ******************************************************

-- entity (Entidade)
-- tb_MqEstRefri uma entidade sem pinos de entrada e saida

entity tb_MqEstRefri is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

-- Architecture (Arquitetura)
 
architecture tb_MqEstRefri_arch of tb_MqEstRefri is
 
-- Declaracao do componente MqEstRefri, referente a sua arquitetura descrita no arquivo MqEstRefri.vhd
 
 component MqEstRefri is
    port (
        clk, reset :in std_logic;
        A : in std_logic_vector(1 downto 0);
        Q, H, R: out std_logic
    );
 end component;
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

    signal clk  :std_logic := '0';
    signal reset:std_logic;
    signal A :std_logic_vector(1 downto 0);

-- Instancia do componente MqEstRefri e interconexao do componente ao processo de estimulo

begin
    u0: MqEstRefri port map (clk, reset, A, open, open, open);

-- Implementação do clock
 clk <= not clk after 5 ns;

 -- Implementacao do processo de estimulo
 estimulo: process
    begin  
        -- Testar colocando apenas moedas de 25 centavos
        for i in 0 to 3 loop
            A <= "00"; -- Mantém Estado
            wait for 10 ns;
            A <= "01"; -- Muda Estado
            wait for 10 ns;
        end loop;

        -- Testar colocando apenas moedas de 50 centavos
        for i in 0 to 1 loop
            A <= "00"; -- Mantém Estado
            wait for 10 ns;
            A <= "10"; -- Muda Estado
            wait for 10 ns;
        end loop;
        A <= "11"; -- Cancelando
        wait for 10 ns;

        -- Testar colocando 1 moeda de 25 e 2 de 50
        A <= "00"; -- Mantém Estado
        wait for 10 ns;
        A <= "01"; -- Muda Estado
        wait for 10 ns;

        for i in 0 to 1 loop
            A <= "00"; -- Mantém Estado
            wait for 10 ns;
            A <= "10"; -- Muda Estado
            wait for 10 ns;
        end loop;
        A <= "11"; -- Cancelando
        wait for 10 ns;

        -- Testando cancelar em cada um dos 4 primeiros estados
        -- Initial
        A <= "11";
        wait for 10 ns;

        -- One
        A <= "01"; -- Mudando para Estado One
        wait for 10 ns;
        A <= "11"; -- Mudando para Estado Cancel_One
        wait for 10 ns;

        -- Two
        A <= "10"; -- Mudando para Estado Two
        wait for 10 ns;
        A <= "11"; -- Mudando para Estado Cancel_Two
        wait for 10 ns;

        -- Three
        A <= "01"; -- Mudando para Estado One
        wait for 10 ns;
        A <= "10"; -- Mudando para Estado Three
        wait for 10 ns;
        A <= "11"; -- Mudando para Estado Cancel_Three
        wait for 10 ns;

        -- Testando Reset Assíncrono
        A <= "10";
        wait for 2.5 ns;
        reset <= '1';
        wait for 5 ns;
        reset <= '0';

        wait;
-- Fim do processo de estimulo
    end process;

--Fim da definiçao da arquitetura
END;
