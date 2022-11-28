library ieee;
use ieee.std_logic_1164.all;

entity vhdl1 is
port(
	A : IN std_logic;
	B : OUT std_logic
);
end entity;

architecture a1 of vhdl1 is
begin

B <= not(A);

end architecture;
