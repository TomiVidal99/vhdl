library ieee;
use ieee.std_logic_1164.all;

entity TP7E4 is
	generic(
		N :integer := 10
	);
	port(
		DATO_A	: in std_logic_vector(N-1 downto 0);
		DATO_B	: in std_logic_vector(N-1 downto 0);
	
		SUMA		: out std_logic_vector(N-1 downto 0);
		Cout		: out std_logic
);
end TP7E4;
 

architecture Arq of TP7E4 is

component FA is
	port
	(
		D1 : in std_logic;
		D2 : in std_logic;
		Ci : in std_logic;
		
		Co : out std_logic;
		So : out std_logic
);
end component;

signal Co :std_logic_vector(N-1 downto 0);	
signal Ci :std_logic_vector(N-1 downto 0);
	
begin

Ci(0)					<= '0';
Ci(N-1 downto 1) 	<= Co(N-2 downto 0);

ForGen: for i in 0 to N-1 generate

	FA_0 : FA port map(D1=>DATO_A(i), D2=>DATO_B(i), Ci=>Ci(i), Co=>Co(i), So=>SUMA(i));

end generate;

Cout <= Co(N-1);

end Arq;