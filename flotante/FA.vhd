-- Implemento un full adder

library IEEE;
use IEEE.std_logic_1164.all;

entity FA is
  PORT(
    i_A, i_B, i_carry  : IN  std_logic;
    o_sum, o_carry     : OUT std_logic
  );
end entity;

architecture rtl of FA is
begin

  o_sum   <= i_A xor i_B xor i_carry;
  o_carry <= (i_A and i_B) or (i_A and i_carry) or (i_B and i_carry);

end architecture rtl;
