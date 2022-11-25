-- Ejercicio 10. TP N° 5

library IEEE;
use IEEE.std_logic_1164.all;

entity ej10 is
	GENERIC(
		BIT_LENGTH : integer := 16
	);
	PORT(
		-- INPUTS
		CLK, RST : IN std_logic;
		dataIn	: IN std_logic_vector((BIT_LENGTH-1) downto 0);
		
		-- OUTPUTS
		dataOut	: OUT std_logic_vector(2 downto 0)
	);
end entity;

architecture a1 of ej10 is
	component paralel_fa
		GENERIC(
			 N_BITS : integer := BIT_LENGTH
		  );
		  PORT(
			 -- INPUTS
			 input1               : IN std_logic_vector( (N_BITS-1) downto 0 ) := (others => '0');
			 input2               : IN std_logic_vector( (N_BITS-1) downto 0 ) := (others => '0');
			 diffEn               : IN std_logic := '0';
			 carryIn              : IN std_logic := '0';

			 -- OUTPUTS
			 carryOut             : OUT std_logic;
			 output               : OUT std_logic_vector( (N_BITS-1) downto 0 )
		  );
  end component;
  
  constant diffEn 				: std_logic := '0';
  constant Ci 						: std_logic := '0';
  
  signal acumulador, auxOut	: std_logic_vector((BIT_LENGTH-1) downto 0) := (others => '0');
  
begin

	FA0 : paralel_fa
	generic map (
		N_BITS => BIT_LENGTH
	)
	port map 
	(
		 -- INPUTS
			 input1               => dataIn,
			 input2               => acumulador,
			 diffEn               => diffEn,
			 carryIn              => Ci,

			 -- OUTPUTS
			 carryOut             => OPEN, -- no la uso
			 output               => auxOut
	);
	
		acumulador <=  (others => '0') when RST = '0' else auxOut when rising_edge(CLK);
		
--		dataOut <= acumulador;
		
		deco0: with acumulador(15 downto 12) select
			dataOut <= 
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
							

end architecture a1;