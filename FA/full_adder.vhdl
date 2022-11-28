-- Full adder

library IEEE;
use IEEE.std_logic_1164.all;

entity full_adder is
  PORT(
    -- INPUTS
    A, B, Ci    : IN std_logic;

    -- OUTPUTS
    S, Co       : OUT std_logic
  );
end entity;

architecture full_adder_arch of full_adder is
begin
  S <= Ci xor (A xor B);
  Co <= (A and B) or (Ci and B) or (Ci and A);
end full_adder_arch;
