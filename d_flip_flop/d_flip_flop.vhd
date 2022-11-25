-- Se implementa un flip flop tipo D

library IEEE;
use IEEE.std_logic_1164.all;

entity d_flip_flop is
  port (
    i_CLK   : IN std_logic := '0'; -- reloj
    i_D     : IN std_logic := '0'; -- entrada D
    o_Q     : OUT std_logic := '0'; -- salida
    o_NQ    : OUT std_logic := '1' -- salida negada
  );
end d_flip_flop;

architecture arq1 of d_flip_flop is
  signal Q: std_logic;
begin

  P1: process(Q, i_CLK, i_D) is
  begin

    -- Disparo en el flaco de subida
    if rising_edge(i_CLK) and (i_D = '1') then
      Q <= '1';
    elsif rising_edge(i_CLK) and (i_D = '0') then
      Q <= '0';
    end if;

    o_Q <= Q;
    o_NQ <= not(Q);

  end process;

end arq1;
