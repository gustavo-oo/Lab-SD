-- Universidade de Brasília
-- Laboratório de Sistemas Digitais
-- Autor : Gustavo Pereira Chaves 
-- Matrícula: 19/0014113
-- Data : 19/03/2021

-- TopModule para interconexão de todos os componentes

-- ****************************************** 
-- TopModule do Circuito: Somador de palavras de 4 bits
--                A Entrada 1
--                B Entrada 2
--                S Saida
-- ******************************************

-- entity (Entidade)
-- top_module uma entidade sem pinos de entrada e saida

entity top_module is end;

--Package (Pacote)
--constantes e bibliotecas

library ieee;
use ieee.std_logic_1164.ALL;
use std.textio.all;
use ieee.numeric_std.all;

-- Architecture (Arquitetura)
 
architecture topmodule_arch of top_module is
 
-- Declaracao do componente questao1, referente a sua arquitetura descrita no arquivo questao1.vhd
 
 component questao1 is
    port (
        A   :in std_logic_vector(3 downto 0);
        B   :in std_logic_vector(3 downto 0);
        S   :out std_logic_vector(4 downto 0)
    );
 end component;

-- Declaracao do componente questao2, referente a sua arquitetura descrita no arquivo questao2.vhd
 
 component questao2 is
    port (
        A   :in std_logic_vector(3 downto 0);
        B   :in std_logic_vector(3 downto 0);
        S   :out std_logic_vector(4 downto 0)
    );
 end component;

-- Declaracao do componente tb_questao3, referente a sua arquitetura descrita no arquivo tb_questao3.vhd

 component tb_questao3 is 
    port (
        A   :out std_logic_vector(3 downto 0);
        B   :out std_logic_vector(3 downto 0);
        dut :in std_logic_vector(4 downto 0);
        gm  :in std_logic_vector(4 downto 0)
    );
    end component;
 
 
-- Sinais auxiliares para a interconexao ao
-- processo de estimulo

  signal a, b :std_logic_vector(3 downto 0);
  signal s_dut, s_gm :std_logic_vector(4 downto 0);
  
-- Instancias dos componentes questao1, questao2 e tb_questao3, e interconexao dos componentes

begin
    U0: questao1 PORT MAP(a, b, s_dut);
    U1: questao2 PORT MAP(a, b, s_gm);
    U3: tb_questao3 PORT MAP(a, b, s_dut, s_gm);

--Fim da definiçao da arquitetura

END;


