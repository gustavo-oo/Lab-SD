-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 23/04/2021

-- Implementação do sistema de temporizacao do controle de semaforos indicando
-- que já se passaram 5 segundos (T5), 6 segundos (T6), 20 segundos (T20), 60 segundos (T60)

-- ******************************************************
--  Circuito: Temporizador do semaforo
--                clk             Entrada 1
--                reset           Entrada 2
--                T5              Saida 1
--                T6              Saida 2
--                T20             Saida 3
--                T60             Saida 4
--                cont_dezena     Saida 5
--                cont_unidade    Saida 6
-- ******************************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity questao2 is 
    port (
        clk, reset : in std_logic;
        cont_dezena, cont_unidade :out std_logic_vector(3 downto 0);
        T5, T6, T20, T60: out std_logic
    );
end questao2;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture questao2_arch of questao2 is
-- Declaracao do componente contador100, referente a sua arquitetura descrita no arquivo questao1.vhd
 
    component contador100 is 
        port (
            clk, reset, enable, load: in std_logic;
            dezload, uniload :in std_logic_vector(3 downto 0);
            cont_dezena, cont_unidade: out std_logic_vector(3 downto 0)
        );
    end component;

-- Declaracao do componente timeflags, referente a sua arquitetura descrita no arquivo timeflags.vhd

    component timeflags is
        port(
            cont_dezena, cont_unidade :in std_logic_vector(3 downto 0);
            T5, T6, T20, T60 :out std_logic
        );
    end component;

-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

signal s_dezena, s_unidade: std_logic_vector(3 downto 0);


begin
-- Instancias do componente contador100 e timeflags e interconexao dos componentes:
    u0: contador100 PORT MAP (clk, reset, '0', '0', "0000", "0000", s_dezena, s_unidade);
    u1: timeflags PORT MAP (s_dezena, s_unidade, T5, T6, T20, T60);   

    cont_dezena <= s_dezena;
    cont_unidade <= s_unidade;

end questao2_arch; 
-- a definicao termina por end


