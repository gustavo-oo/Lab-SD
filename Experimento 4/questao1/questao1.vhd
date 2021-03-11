-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 12/03/2021

-- Implementação das funções booleanas X = A'.B'.C'+ A.B'.C' + A.B e Y = A'.B'+ A'.B.C' + A.B.C utilizando
-- 2 multiplexadores como component

-- ****************************************** 
--  Circuito: 2 funções booleanas de 3 entradas: 
--                A Entrada 1
--                B Entrada 2
--                C Entrada 3
--                X Saida 1 
--                Y Saida 2
-- ******************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity questao1 is 
    port (
        A   :in std_logic;
        B   :in std_logic;
        C   :in std_logic;
        X   :out std_logic;
        Y   :out std_logic
    );
end questao1;


--Architecture (Arquitetura)
--implementacoes do projeto

architecture rtl of questao1 is

-- Declaracao do componente mux, referente a sua arquitetura descrita no arquivo mux.vhd
    component mux is
        port (
            D   :in std_logic_vector(3 downto 0); 
            S   :in std_logic_vector(1 downto 0); 
            Y   :out std_logic
        );
    end component;

-- Sinais auxiliares para a interconexao
signal d1_signal :std_logic_vector(3 downto 0);
signal d2_signal :std_logic_vector(3 downto 0);
signal s_signal :std_logic_vector(1 downto 0);

-- a definicao inicia por 
begin
-- Instancias do componente mux e interconexao do componente as portas de entrada:

-- X = f(A, B, C)
    u1: mux PORT MAP (d1_signal, s_signal, X);

    d1_signal(0) <= '0';
    d1_signal(1) <= C;
    d1_signal(2) <= not C;
    d1_signal(3) <= '1'; 
    s_signal(1) <= A;
    s_signal(0) <= B;

-- Y = f(A, B, C)   
    u2: mux PORT MAP (d2_signal, s_signal, Y);

    d2_signal(0) <= '1';
    d2_signal(1) <= not C;
    d2_signal(2) <= '0';
    d2_signal(3) <= C;  

end rtl; 
-- a definicao termina por end

