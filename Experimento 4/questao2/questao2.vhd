-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 12/03/2021

-- Implementação das função booleana: S = F.G + A.B.C.D.E'.F'.G + A'.B'.C'.D'.E'.F'.G + A.B'.C.E.F.G' +
--                                       A'.B.C.D.E'.F.G' + A.B.C.D.E.F'.G' + A.B'.C'.D.E.F'.G',
-- utilizando um decodificador de 4 para 16 bits e um multiplexador de 8 bits de entrada.

-- ****************************************** 
--  Circuito: 1 função booleana de 7 entradas: 
--                A Entrada 1
--                B Entrada 2
--                C Entrada 3
--                D Entrada 4
--                E Entrada 5
--                F Entrada 6
--                G Entrada 7
--                S Saida
-- ******************************************

--Package (Pacote)
--constantes e bibliotecas

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity (Entidade)
--pinos de entrada e saída

entity questao2 is 
    port (
        A, B, C, D, E, F, G :in std_logic;
        S :out std_logic
    );
end questao2;


--Architecture (Arquitetura)
--implementacoes do projeto

architecture rtl of questao2 is

-- Declaracao do componente mux_8x1, referente a sua arquitetura descrita no arquivo mux_8x1.vhd
    component mux_8x1 is
        port (
            D   :in std_logic_vector(7 downto 0); 
            S   :in std_logic_vector(2 downto 0); 
            Y   :out std_logic
        );
    end component;

-- Declaracao do componente decod_4x16, referente a sua arquitetura descrita no arquivo decod_4x16.vhd
    component decod_4x16 is 
        port (
            A   :in std_logic_vector(3 downto 0);  
            Y   :out std_logic_vector(15 downto 0)
        );
    end component;

-- Sinais auxiliares para a interconexao
signal y_signal : std_logic_vector(15 downto 0);
signal d_signal : std_logic_vector(7 downto 0);
 
-- a definicao inicia por 
begin
--S = f(A,B,C,D,E,F,G)

-- Instancia do componente decod_4x16 e interconexao do componente as portas de entrada:
    u0: decod_4x16 PORT MAP (
        A(3) => A,
        A(2) => B,
        A(1) => C,
        A(0) => D, 
        Y => y_signal
    );

-- Instancia do componente mux_8x1 e interconexao do componente as portas de entrada:
    u1: mux_8x1 PORT MAP (
        D => d_signal,
        S(2) => E,
        S(1) => F,
        S(0) => G,
        Y => S
    ); 

    d_signal(0) <= '0';
    d_signal(1) <= y_signal(0) or y_signal(15);
    d_signal(2) <= y_signal(7);
    d_signal(3) <= '1';
    d_signal(4) <= y_signal(9) or y_signal(15);
    d_signal(5) <= '0';
    d_signal(6) <= y_signal(10) or y_signal(11);
    d_signal(7) <= '1';

end rtl; 
-- a definicao termina por end


