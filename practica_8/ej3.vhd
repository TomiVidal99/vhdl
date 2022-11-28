library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity ej3 is
  PORT(
    -- tengo que usar un vector de 10 de longitud si o si?
    SW        : IN  std_logic_vector(9 downto 0);
    HEX0_D    : OUT std_logic_vector(6 downto 0);
    HEX1_D    : OUT std_logic_vector(6 downto 0);
    HEX2_D    : OUT std_logic_vector(6 downto 0);
    HEX3_D    : OUT std_logic_vector(6 downto 0)
    --HEX0_DP   : OUT std_logic
  );
end entity;

architecture A1 of ej3 is

	signal S: std_logic_vector(3 downto 0); --seleccion de display
	
  component mapeo7segments is
    PORT(
      entrada    : IN  std_logic_vector(3 downto 0);
		  habilitado : IN  std_logic;
      salida     : OUT std_logic_vector(6 downto 0)
    );
  end component mapeo7segments;
begin


	process(SW) is
		begin
		case SW(9 downto 8) is
			when "00" => S <= "0001"; -- display 0
			when "01" => S <= "0010"; -- display 1
			when "10" => S <= "0100"; -- display 2
			when "11" => S <= "1000"; -- display 3
			when others => S <= "1111"; -- todos activos, sinonimo de error
			end case;

		end process;

  d7s0:
    mapeo7segments port map(
      entrada => SW(3 downto 0),
      habilitado => S(0),
      salida => HEX0_D
    );

	d7s1:
    mapeo7segments port map(
      entrada => SW(3 downto 0),
      habilitado => S(1),
      salida => HEX1_D
    );


	d7s2:
    mapeo7segments port map(
      entrada => SW(3 downto 0),
      habilitado => S(2),
      salida => HEX2_D
    );


	 d7s3:
    mapeo7segments port map(
      entrada => SW(3 downto 0),
      habilitado => S(3),
      salida => HEX3_D
    );

end A1;
