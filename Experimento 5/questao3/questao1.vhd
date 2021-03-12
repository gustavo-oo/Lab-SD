-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 19/03/2021

-- Implementação de um somador de palavras de 4 bits utilizando somadores completos

-- ****************************************** 
--  Circuito: Somador de palavras de 4 bits:
--                A Entrada 1
--                B Entrada 2
--                S Saida
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
        A   :in std_logic_vector(3 downto 0);
        B   :in std_logic_vector(3 downto 0);
        S   :out std_logic_vector(4 downto 0)
    );
end questao1;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture rtl of questao1 is

-- Declaracao do componente SOMADOR, referente a sua arquitetura descrita no arquivo somador.vhd
    component SOMADOR is
        port (
            A      :in std_logic; 
            B      :in std_logic; 
            Cin    :in std_logic; 
            S      :out std_logic; 
            Cout   :out std_logic 
        );
    end component;

-- Sinais auxiliares para a interconexao
signal carry_signal :std_logic_vector(4 downto 0);

-- a definicao inicia por 
begin
    carry_signal(0) <= '0';

-- S = f(A, B)
    sum: for i in 0 to 3 generate
        -- Instancia do componente SOMADOR e interconexao do componente as portas de entrada:
        u0: SOMADOR PORT MAP (A(i), B(i), carry_signal(i), S(i), carry_signal(i+1));
    end generate;

    S(4) <= carry_signal(4);
    
end rtl; 
-- a definicao termina por end

