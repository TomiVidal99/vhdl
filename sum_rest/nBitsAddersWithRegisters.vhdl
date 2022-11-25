-- Sumador (con full adders) de N_BITS con registros de desplazamientos.

library IEEE;
use IEEE.std_logic_1164.all;

entity nBitsAdder is
  GENERIC(
    N_BITS : integer := 2
  );
  PORT(
    -- INPUTS
    clk, setEn           : IN std_logic;
    regA, regB           : IN std_logic_vector( (N_BITS-1) downto 0 ) := (others => '0');

    -- OUTPUTS
    regOut               : OUT std_logic_vector( (N_BITS-1) downto 0 )
  );
end entity;

architecture A1 of nBitsAdder is

  component FA
    PORT(
    -- INPUTS
    input1      : IN  std_logic;
    input2      : IN  std_logic;
    carryIn     : IN  std_logic;

    -- OUTPUTS
    output      : OUT std_logic;
    carryOut    : OUT std_logic
  );
  end component;



begin

  process (clk) is
  begin

    if (falling_edge(clk) = '1')

  end process;

end A1;
