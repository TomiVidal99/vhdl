library IEEE;
use IEEE.std_logic_1164.all;

entity decoderBCD7s is
  PORT(
    input  : IN  INTEGER RANGE 0 TO 9;
    output : OUT BIT_VECTOR(6 DOWNTO 0)
  );
end entity;

architecture A1 of decoderBCD7s is
  signal temp: BIT_VECTOR(6 downto 0);
begin

  WITH input SELECT
    temp <= B"1111110" WHEN 0,
            B"0110000" WHEN 1,
            B"1101101" WHEN 2,
            B"1111001" WHEN 3,
            B"1010011" WHEN 4,
            B"1011011" WHEN 5,
            B"1011111" WHEN 6,
            B"1110000" WHEN 7,
            B"1111111" WHEN 8,
            B"1111011" WHEN 9,
            B"0000000" WHEN OTHERS;

  output <= temp;

end A1;
