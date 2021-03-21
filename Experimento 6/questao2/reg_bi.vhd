-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 26/03/2021

-- Implementação de um registrador de deslocamento bidirecional de 4 bits gatilhado pela borda de subida do clock.

-- ******************************************************
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

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity reg_bi is 
    port (
        clk, rst, load, dir, L, R :in std_logic;
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0)
    );
end reg_bi;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture reg_bi_arch of reg_bi is


-- Sinal auxiliar para a interconexao
signal Q_buffer :std_logic_vector(3 downto 0);

-- a definicao inicia por 
begin

-- Q = f(clk, rst, load, dir, D, L, R)
    
    process(clk)
    begin
        if (rising_edge(clk)) then
            if (rst = '1') then Q_buffer <= "0000";
            elsif (load = '1') then Q_buffer <= D;
            elsif (dir = '0') then Q_buffer <= std_logic_vector(unsigned(Q_buffer) sll 1); Q_buffer(0) <= L;
            elsif (dir = '1') then Q_buffer <= std_logic_vector(unsigned(Q_buffer) srl 1); Q_buffer(3) <= R;
            end if;
        end if; 
    end process;
    Q <= Q_buffer; 

end reg_bi_arch; 
-- a definicao termina por end
