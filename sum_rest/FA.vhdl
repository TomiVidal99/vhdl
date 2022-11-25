-- Full Adder
-- Tomas Vidal

library IEEE;
use IEEE.std_logic_1164.all;

entity FA is
  PORT(
    -- INPUTS
    input1      : IN  std_logic;
    input2      : IN  std_logic;
    carryIn     : IN  std_logic;

    -- OUTPUTS
    output      : OUT std_logic;
    carryOut    : OUT std_logic
  );
end entity;

architecture A1 of FA is
begin

  output <= (input1 xor input2 xor carryIn) or (input1 and input2 and carryIn);
  carryOut <= (input1 and input2) or (input1 and carryIn) or (input2 and carryIn);

end A1;
