-- Algoritmo de booth
-- Se emplea para multiplicar dos numero, uno de N bits y otro de 4.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity booth is
  GENERIC(
    N         : INTEGER := 4
  );
  PORT(
    A         : IN  std_logic_vector((N-1) downto 0);
    B         : IN  std_logic_vector(3 downto 0);
    product   : OUT std_logic_vector(N downto 0)
  );
end entity;

architecture A1 of booth is
  signal tempProduct : std_logic_vector(N downto 0);
begin

  
  -- Compila pero no corre la simulacion en modelsim (probablemente por las sumas)
  with B(1 downto 0) select
    tempProduct <= (others => '0')                                        when "00",
                   '0' & A(3 downto 0)                                    when "01",
                   A(3 downto 0) & '0'                                    when "10",
                   (A(3)&A(2)&A(1)&A(0)&'0') + (A(3)&A(2)&A(1)&A(0)&'0')  when "11";

  product <= tempProduct;


end A1;
