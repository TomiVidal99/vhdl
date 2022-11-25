library ieee;
use ieee.std_logic_1164.all;

entity FA is
	port
	(
		D1 : in std_logic;
		D2 : in std_logic;
		Ci : in std_logic;
		
		Co : out std_logic;
		So : out std_logic
);
end FA;


architecture Arq of FA is


begin

So 	<= D1 xor D2 xor Ci;

Co 	<= (D1 and D2) or (D1 and Ci) or (D2 and Ci);


end Arq;

