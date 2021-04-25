-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 16/04/2021

-- Implementação de uma máquina de refrigerantes utilizando uma máquina de estados de Moore

-- ******************************************************
--  Circuito: Máquina de Refrigerante de Moore:
--                clk   Entrada 1
--                reset Entrada 2
--                A     Entrada 3
--                Q     Saida 1 - Moeda de 25 centavos
--                H     Saida 2 - Moeda de 50 centavos
--                R     Saida 3 - Refrigerante
-- ******************************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity MqEstRefri is 
    port (
        clk, reset :in std_logic;
        A : in std_logic_vector(1 downto 0);
        Q, H, R: out std_logic
    );
end MqEstRefri;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture MqEstRefri_arch of MqEstRefri is

-- Definição de tipo state que indica os estados possiveis
    type state is (Init, One, Two, Three, Four, Five, Cancel_One, Cancel_Two, Cancel_Three);

-- Sinais auxiliares para armazenar o estado atual e o próxima estado respectivamente
    signal current_state :state := Init;
    signal next_state :state;

-- a definicao inicia por 
begin

-- Processo síncrono da maquina de estados
    sync_process: process (clk, reset)
    begin
        if (reset = '1') then
            current_state <= Init;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
   
-- Processo combinacional da maquina de estados
    comb_process: process (current_state, A)
    begin
        Q <= '0'; H <= '0'; R <= '0';
        case current_state is
            when Init =>
                case A is
                    when "00" => next_state <= Init;
                    when "01" => next_state <= One;
                    when "10" => next_state <= Two;
                    when others => next_state <= Init;
                end case;
            when One =>
                case A is
                    when "00" => next_state <= One;
                    when "01" => next_state <= Two;
                    when "10" => next_state <= Three;
                    when others => next_state <= Cancel_One;
                end case;
            when Two =>
                case A is
                    when "00" => next_state <= Two;
                    when "01" => next_state <= Three;
                    when "10" => next_state <= Four;
                    when others => next_state <= Cancel_Two;
                end case;
            when Three =>
                case A is
                    when "00" => next_state <= Three;
                    when "01" => next_state <= Four;
                    when "10" => next_state <= Five;
                    when others => next_state <= Cancel_Three;
                end case;
            when Four =>
                case A is
                    when "00" => next_state <= Init;
                    when "01" => next_state <= One;
                    when "10" => next_state <= Two;
                    when others => next_state <= Init;
                end case;
                R <= '1';
            when Five =>
                case A is
                    when "00" => next_state <= Init;
                    when "01" => next_state <= One;
                    when "10" => next_state <= Two;
                    when others => next_state <= Init;
                end case;
                Q <= '1'; R <= '1';
            when Cancel_One =>
                case A is
                    when "00" => next_state <= Init;
                    when "01" => next_state <= One;
                    when "10" => next_state <= Two;
                    when others => next_state <= Init;
                end case;
                Q <= '1';
            when Cancel_Two =>
                case A is
                    when "00" => next_state <= Init;
                    when "01" => next_state <= One;
                    when "10" => next_state <= Two;
                    when others => next_state <= Init;
                end case;
                H <= '1';
            when Cancel_Three =>
                case A is
                    when "00" => next_state <= Init;
                    when "01" => next_state <= One;
                    when "10" => next_state <= Two;
                    when others => next_state <= Init;
                end case;
                Q <= '1'; H <= '1';
        end case;
    end process;

end MqEstRefri_arch; 
-- a definicao termina por end
