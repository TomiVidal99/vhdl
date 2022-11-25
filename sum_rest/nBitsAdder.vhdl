-- Sumador (con full adders) de N_BITS.

library IEEE;
use IEEE.std_logic_1164.all;

entity nBitsAdder is
  GENERIC(
    N_BITS : integer := 2
  );
  PORT(
    -- INPUTS
    input1               : IN std_logic_vector( (N_BITS-1) downto 0 ) := (others => '0');
    input2               : IN std_logic_vector( (N_BITS-1) downto 0 ) := (others => '0');
    carryIn              : IN std_logic := '0';

    -- OUTPUTS
    carryOut             : OUT std_logic;
    output               : OUT std_logic_vector( (N_BITS-1) downto 0 )
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

  signal carryOutAux  : std_logic_vector( (N_BITS-1) downto 0 );
  signal carryInAux   : std_logic_vector( (N_BITS-1) downto 0 );

begin

  createSummer:
  for n in (N_BITS-1) downto 0 generate
    FullAdder: FA
      PORT MAP(
          input1        => input1(n),
          input2        => input2(n),
          carryIn       => carryInAux(n),
          output        => output(n),
          carryOut      => carryOutAux(n)
      );
  end generate;

  carryInAux((N_BITS-1) downto 0) <= carryOutAux((N_BITS-2) downto 0) & carryIn;
  carryOut <= carryOutAux(N_BITS-1);

end A1;
