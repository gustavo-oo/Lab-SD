-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves
-- Data : 26/02/2021

-- Implementação de um Multiplexador 4x1 (4 entradas de dados, 1 saída e 1 seletor de 2 bits)

-- ****************************************** 
--  Circuito: Multiplexador de 2 entradas: 
--                D Entrada 1
--                S Seletor
--                Y  Saida
-- ******************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;

--Entity (Entidade)
--pinos de entrada e saída

entity mux is 
    port (
        D   :in std_logic_vector(3 downto 0); 
        S   :in std_logic_vector(1 downto 0); 
        Y   :out std_logic
    );
end mux;


--Architecture (Arquitetura)
--implementacoes do projeto

architecture rtl of mux is
 
-- a definicao inicia por 
begin

-- Y = f(S, D)

    process (D, S) is
    begin
        if S = "00" then
            Y <= D(0);
        elsif S = "01" then
            Y <= D(1);
        elsif S = "10" then
            Y <= D(2);
        elsif S = "11" then
            y <= D(3);
        end if;
    end process;

end rtl; 

-- a definicao termina por end
