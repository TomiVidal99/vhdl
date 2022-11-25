-- Testeo algunas cosas de las filminas
library IEEE;
use IEEE.std_logic_1164.all;

entity filmina1 is
  PORT(
    T, CLK, RST, SET  : IN std_logic;
    Q, NQ             : OUT std_logic
  );
end entity;

architecture A1 of filmina1 is
  signal tempQ: std_logic;
begin

  -- T flip flip de flanco decreciente
  ToggleFF: 
  process(T)
  begin

    if (falling_edge(CLK) and SET = '1') then
      tempQ <= '1';
    elsif (falling_edge(CLK) and RST = '1') then
      tempQ <= '0';
    elsif (falling_edge(CLK) and T = '1') then
      tempQ <= not(tempQ);
    end if;

    Q <= tempQ;
    NQ <= not(tempQ);

  end process;

end;
