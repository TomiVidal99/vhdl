library IEEE;
use IEEE.std_logic_1164.all;

entity paralel_fa is
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
end entity;

architecture A1 of paralel_fa is

  component FA
    PORT(
    -- INPUTS
    inputA      : IN  std_logic;
    inputB      : IN  std_logic;
    carryIn     : IN  std_logic;
    diffEn      : IN  std_logic;

    -- OUTPUTS
    result      : OUT std_logic;
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
          inputA        => input1(n),
          inputB        => input2(n),
          carryIn       => carryInAux(n),
          diffEn        => diffEn,
          result        => output(n),
          carryOut      => carryOutAux(n)
      );
  end generate;

  carryInAux((N_BITS-1) downto 0) <= carryOutAux((N_BITS-2) downto 0) & carryIn;
  carryOut <= carryOutAux(N_BITS-1);

end A1;
