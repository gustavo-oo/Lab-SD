-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 23/04/2021

-- Implementação de um contador modulo 10, com reset e load sincronos

-- ******************************************************
--  Circuito: Contador modulo 100 com saida BCD
--                clk             Entrada 1
--                reset           Entrada 2
--                enable          Entrada 3 (ativo baixo)
--                rci             Entrada 3 (ativo baixo)
--                load            Entrada 4
--                D               Entrada 5
--                Q               Saida 1
--                rco             Saida 2 (ativo baixo)
-- ******************************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity contador10 is 
    port (
        clk, reset, enable, rci, load :in std_logic;
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0);
        rco : out std_logic
    );
end contador10;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture contador10_arch of contador10 is

-- Definição de tipo state que indica os estados possiveis
    type state is (ST0, ST1, ST2, ST3, ST4, ST5, ST6, ST7, ST8, ST9);

-- Sinais auxiliares para armazenar estado atual e mudanças de estado
    signal current_state, next_state, load_state :state;

-- a definicao inicia por 
begin

    with D select
        load_state <= ST0 when "0000",
                      ST1 when "0001",
                      ST2 when "0010",
                      ST3 when "0011",
                      ST4 when "0100",
                      ST5 when "0101",
                      ST6 when "0110",
                      ST7 when "0111",
                      ST8 when "1000",
                      ST9 when "1001",
                      ST0 when others;

-- Processo síncrono da maquina de estados
    sync_process: process(clk)
    begin
        if rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;
   
-- Processo combinacional da maquina de estados
    comb_process: process (current_state, reset, enable, rci, load, load_state)
    begin
        case current_state is
            when ST0 =>
                Q <= "0000";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST1;
                else next_state <= ST0;
                end if;

            when ST1 =>
                Q <= "0001";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST2;
                else next_state <= ST1;
                end if;

            when ST2 =>
                Q <= "0010";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST3;
                else next_state <= ST2;
                end if;

            when ST3 =>
                Q <= "0011";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST4;
                else next_state <= ST3;
                end if;

            when ST4 =>
                Q <= "0100";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST5;
                else next_state <= ST4;
                end if;

            when ST5 =>
                Q <= "0101";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST6;
                else next_state <= ST5;
                end if;

            when ST6 =>
                Q <= "0110";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST7;
                else next_state <= ST6;
                end if;

            when ST7 =>
                Q <= "0111";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST8;
                else next_state <= ST7;
                end if;

            when ST8 =>
                Q <= "1000";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST9;
                else next_state <= ST8;
                end if;

            when ST9 =>
                Q <= "1001";
                rco <= '0';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST0;
                else next_state <= ST9;
                end if;

            when others =>
                Q <= "0000";
                rco <= '1';
                if (reset = '1') then next_state <= ST0;
                elsif (load = '1') then next_state <= load_state;
                elsif ((enable = '0') or (rci = '0')) then next_state <= ST1;
                else next_state <= ST0;
                end if;

        end case;
    end process;

end contador10_arch; 
-- a definicao termina por end

