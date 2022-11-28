-- Test to see if everything works correctly
library IEEE;
use IEEE.std_logic_1164.all;

entity test1 is
  PORT(
    A, B, clk   : IN std_logic;
    output  : OUT std_logic
      );
end test1;

architecture a1 of test1 is
  signal temp_sum: std_logic;
begin

  process(A, B, clk)
  begin

    if (rising_edge(clk)) then
      temp_sum <= A or B;
    end if;

  end process;

  output <= temp_sum;

end architecture a1;
