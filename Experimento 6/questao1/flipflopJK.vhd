-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 26/03/2021

-- Implementação de um flip-flop JK gatilhado na borda de subida do clock.

-- ****************************************** 
--  Circuito: Flip-Flop JK:
--                pr  Entrada 1
--                clr Entrada 2
--                clk Entrada 3
--                J   Entrada 4
--                K   Entrada 5
--                Q   Saida
-- ******************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity flipflopJK is 
    port (
        pr, clr, clk, J, K :in std_logic;
        Q : out std_logic
    );
end flipflopJK;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture flipflopJK_arch of flipflopJK is


-- Sinal auxiliar para a interconexao
signal JK :std_logic_vector(1 downto 0);
signal Q_buffer :std_logic := '0';

-- a definicao inicia por 
begin
    JK <= J & K;

-- Q = f(pr, clr, clk, J, K)
    
    process(pr, clr, clk)
    begin
        if pr = '1' then
            Q_buffer <= '1';
        elsif clr = '1' then
            Q_buffer <= '0';
        elsif rising_edge(clk) then
            if JK = "01" then Q_buffer <= '0'; end if;
            if JK = "10" then Q_buffer <= '1'; end if;
            if JK = "11" then Q_buffer <= not(Q_buffer); end if;
        end if;
    end process;   
    Q <= Q_buffer; 

end flipflopJK_arch; 
-- a definicao termina por end

