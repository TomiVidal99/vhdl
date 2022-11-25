library ieee;
use ieee.std_logic_1164.all;

entity EJ10 is
	port
	(
		CLK		: IN std_logic;
		RSTn 		: IN std_logic;
		DataIn 	: IN std_logic_vector(15 downto 0);
		
		DataOut 	: OUT std_logic_vector(2 downto 0)
);
end EJ10;


architecture Arq of EJ10 is

component RPAdder is
	generic(
		N 			:integer := 10
	);
	port(
		DATO_A	: IN std_logic_vector(N-1 downto 0);
		DATO_B	: IN std_logic_vector(N-1 downto 0);
	
		SUMA		: OUT std_logic_vector(N-1 downto 0);
		Cout		: OUT std_logic
	);
end component;

signal 	Acumulador 	: std_logic_vector(15 downto 0);
signal	RPAOut		: std_logic_vector(15 downto 0);
begin


RPA0: RPAdder 
	generic map(
		N 		=> 16
	)
	port map(
		DATO_A 	=>	DataIn, 
		DATO_B	=> Acumulador, 
		SUMA		=> RPAOut, 
		Cout		=> open
	);


Acumulador <= (others=>'0') when RSTn = '0' else RPAOut when rising_edge(CLK);



with Acumulador(15 downto 12) select DataOut <=
	"001" when "0000",
	"010" when "0001",
	"011" when "0010",
	"011" when "0011",
	"011" when "0100",
	"010" when "0101", 
	"001" when "0110",
	"111" when "0111",
	"110" when "1000", 
	"101" when "1001", 
	"100" when "1010",
	"100" when "1011", 
	"100" when "1100",
	"101" when "1101",
	"110" when "1110",
	"111" when "1111",
	"000" when others;
	
end Arq;



--------------------------------------------
-- Implementación con librería aritmética --
--------------------------------------------

--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_unsigned.all;
--
--entity EJ10 is
--	port
--	(
--		CLK		: IN std_logic;
--		RSTn 		: IN std_logic;
--		DataIn 	: IN std_logic_vector(15 downto 0);
--		
--		DataOut 	: OUT std_logic_vector(2 downto 0)
--);
--end EJ10;
--
--
--architecture Arq of EJ10 is
--
--signal 	Acumulador 	: std_logic_vector(15 downto 0);
--signal	RPAOut		: std_logic_vector(15 downto 0);
--begin
--
--
--Acumulador <= (others=>'0') when RSTn = '0' else Acumulador + DataIn when rising_edge(CLK);
--
--
--with Acumulador(15 downto 12) select DataOut <=
--	"001" when "0000",
--	"010" when "0001",
--	"011" when "0010",
--	"011" when "0011",
--	"011" when "0100",
--	"010" when "0101", 
--	"001" when "0110",
--	"111" when "0111",
--	"110" when "1000", 
--	"101" when "1001", 
--	"100" when "1010",
--	"100" when "1011", 
--	"100" when "1100",
--	"101" when "1101",
--	"110" when "1110",
--	"111" when "1111",
--	"000" when others;
--	
--end Arq;

