-- Full adder
-- with an option to do difference
library IEEE;
use IEEE.std_logic_1164.all;

entity FA is
  PORT(
    -- INPUTS
    inputA      : IN  std_logic;
    inputB      : IN  std_logic;
    carryIn     : IN  std_logic;
    diffEn      : IN  std_logic;

    -- OUTPUTS
    result      : OUT std_logic;
    carryOut    : OUT std_logic
  );
end entity;

architecture A1 of FA is
begin

  
  -- Return the sum if diffEn = '0' else return the difference
  sum_or_difference:
  process(diffEn, inputA, inputB, carryIn) is
  begin
  
    if (diffEn = '0') then
      result    <= (inputA xor inputB) xor carryIn;
      carryOut  <= (inputA and inputB) or (inputB and carryIn) or (inputA and carryIn);
    else
      result    <= (inputA xor inputB) xor carryIn;
      carryOut  <= (not(inputA) and inputB) or (not(inputA) and carryIn) or (inputB and carryIn);
    end if;
  
  end process;


end A1;
