-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 23/04/2021

-- Implementação de um contador modulo 100 com saida BCD, com reset e load sincronos
-- utilizando 2 contadores de modulo 10

-- ******************************************************
--  Circuito: Contador modulo 100 com saida BCD
--                clk             Entrada 1
--                reset           Entrada 2
--                enable          Entrada 3 (ativo baixo)
--                load            Entrada 4
--                dezload         Entrada 5
--                uniload         Entrada 6
--                cont_dezena     Saida 1
--                cont_unidade    Saida 2
-- ******************************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity contador100 is 
    port (
        clk, reset, enable, load: in std_logic;
        dezload, uniload :in std_logic_vector(3 downto 0);
        cont_dezena, cont_unidade: out std_logic_vector(3 downto 0)
    );
end contador100;

--Architecture (Arquitetura)
--implementacoes do projeto

architecture contador100_arch of contador100 is
-- Declaracao do componente contador10, referente a sua arquitetura descrita no arquivo contador10.vhd
 
    component contador10 is 
        port (
            clk, reset, enable, rci, load :in std_logic;
            D : in std_logic_vector(3 downto 0);
            Q : out std_logic_vector(3 downto 0);
            rco : out std_logic
        );
    end component;

-- Sinal auxiliares para a interconexao ao
-- processo de estimulo

signal signal_rco: std_logic;

begin
-- Instancias do componente contador10 e interconexao dos componentes:
    unidade: contador10 PORT MAP (clk, reset, enable, enable, load, uniload, cont_unidade, signal_rco);
    dezena: contador10 PORT MAP (clk, reset, signal_rco, signal_rco, load, dezload, cont_dezena, open);

end contador100_arch; 
-- a definicao termina por end

