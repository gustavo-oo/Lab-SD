-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 23/04/2021

-- Implementação da máquina de estados que será utlizada no semáforo

-- ******************************************************
--  Circuito: Máquina de Estados de Mealy do Semáforo:
--              clk           Entrada 1
--              ligadesliga   Entrada 2
--              sensorA       Entrada 3
--              sensorB       Entrada 4
--              T5            Entrada 5
--              T6            Entrada 6
--              T20           Entrada 7
--              T60           Entrada 8
--              semaforoA     Saida 1
--              semaforoB     Saida 2
--              resetcounter  Saida 3
-- ******************************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity MaqEstados is 
    port (
        clk, ligadesliga, sensorA, sensorB, T5, T6, T20, T60 :in std_logic;
        semaforoA, semaforoB :out std_logic_vector(2 downto 0);
        resetcounter :out std_logic
    );
end MaqEstados;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture MaqEstados_arch of MaqEstados is    
-- Definição de tipo state que indica os estados possiveis
    type state is (vermelhoA, verdeA, trocaA, vermelhoB, verdeB, trocaB, desligado_vermelho, desligado_amarelo);

-- Sinais auxiliares para armazenar o estado atual e o próxima estado respectivamente
    signal current_state :state := vermelhoA;
    signal next_state :state;

-- a definicao inicia por 
begin

-- Processo síncrono da maquina de estados
    sync_process: process (clk, ligadesliga)
    begin
        if rising_edge(clk) or rising_edge(ligadesliga) or falling_edge(ligadesliga) then
            current_state <= next_state;
            resetcounter <= '0';
        end if;
    end process;
   
-- Processo combinacional da maquina de estados
    comb_process: process (current_state, T5, T6, T20, T60, ligadesliga)
    begin
        case current_state is
            when vermelhoA =>
                if ligadesliga = '0' then 
                    next_state <= desligado_vermelho;
                    resetcounter <= '1';
                else
                    semaforoA <= "100"; semaforoB <= "100";
                    if T5 = '1' then 
                        next_state <= verdeA;
                        resetcounter <= '1';
                    else
                        next_state <= current_state;
                    end if;
                end if;

            when verdeA =>
                if ligadesliga = '0' then 
                    next_state <= desligado_vermelho;
                    resetcounter <= '1';
                else
                    semaforoA <= "001"; semaforoB <= "100";
                    if T60 = '1' then 
                        next_state <= trocaA;
                        resetcounter <= '1';
                    elsif T20 = '1' then
                        if sensorA = '1' then next_state <= current_state;
                        elsif sensorB = '1' then 
                            next_state <= trocaA;
                            resetcounter <= '1';
                        end if;
                    else
                        next_state <= current_state;
                    end if;
                end if;

            when trocaA =>
                if ligadesliga = '0' then 
                    next_state <= desligado_vermelho;
                    resetcounter <= '1';
                else
                    semaforoA <= "110"; semaforoB <= "100";
                    if T6 = '1' then 
                        next_state <= vermelhoB;
                        resetcounter <= '1';
                    else
                        next_state <= current_state;
                    end if;
                end if;
                
            when vermelhoB =>
            if ligadesliga = '0' then 
                next_state <= desligado_vermelho;
                resetcounter <= '1';
            else
                semaforoA <= "100"; semaforoB <= "100";
                if T5 = '1' then 
                    next_state <= verdeB;
                    resetcounter <= '1';
                else
                    next_state <= current_state;
                end if;
            end if;

            when verdeB =>
            if ligadesliga = '0' then 
                next_state <= desligado_vermelho;
                resetcounter <= '1';
            else
                semaforoA <= "100"; semaforoB <= "001";
                if T60 = '1' then 
                    next_state <= trocaB;
                    resetcounter <= '1';
                elsif T20 = '1' then
                    if sensorB = '1' then next_state <= current_state;
                    elsif sensorA = '1' then 
                        next_state <= trocaB;
                        resetcounter <= '1';
                    end if;
                else
                    next_state <= current_state;
                end if;
            end if;

            when trocaB =>
            if ligadesliga = '0' then 
                next_state <= desligado_vermelho;
                resetcounter <= '1';
            else
                semaforoA <= "100"; semaforoB <= "110";
                if T6 = '1' then 
                    next_state <= vermelhoA;
                    resetcounter <= '1';
                else
                    next_state <= current_state;
                end if;
            end if;

            when desligado_vermelho =>
                semaforoA <= "100"; semaforoB <= "100";
                if ligadesliga = '0' then 
                    next_state <= vermelhoA;
                    resetcounter <= '1';
                else 
                    next_state <= desligado_amarelo;
                    resetcounter <= '1';
                end if;

            when desligado_amarelo =>
                semaforoA <= "010"; semaforoB <= "010";
                if ligadesliga = '0' then 
                    next_state <= vermelhoA;
                    resetcounter <= '1';
                else 
                    next_state <= desligado_vermelho;
                    resetcounter <= '1';
                end if;
        end case;
    end process;

end MaqEstados_arch; 
-- a definicao termina por end

