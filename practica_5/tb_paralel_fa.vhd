-- Test bench para los FA en paralelo

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_paralel_fa is
	GENERIC(
			 N_BITS : integer := 8
	);
end entity;

architecture a1 of tb_paralel_fa is
	component paralel_fa
		GENERIC(
		 N_BITS : integer := 8
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
	
	signal inputA, inputB, output  	: std_logic_vector( (N_BITS-1) downto 0 );
	signal diffEn, carryIn, carryOut : std_logic;
	
begin

	PAR_FA : paralel_fa
	generic map
	(
		N_BITS => 8
	)
	port map 
	(
		inputA 	=> inputA,
		inputB 	=> inputB,
		output 	=> output,
		diffEn 	=> diffEn,
		carryIn 	=> carryIn,
		carryOut => carryOut
	);

	estimulos:
	process is
	begin
		wait for 100 ns;
		inputA <= "00000001";
		inputB <= "00000001";
	end process;

end architecture a1;