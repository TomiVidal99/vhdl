-- N bits adder with a full adder design in series with shift register

library IEEE;
use IEEE.std_logic_1164.all;

entity series_fa is
  GENERIC(
    N_BITS : integer := 4
  );
  PORT(
    CLK, loadData : IN  std_logic;
    RegA, RegB    : IN  std_logic_vector((N_BITS-1) downto 0);
    RegOut        : OUT std_logic_vector((N_BITS-1) downto 0)
  );
end entity;

architecture A1 of series_fa is

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

  constant diffEn       : std_logic := '0';

  signal RA, RB, RO     : std_logic_vector((N_BITS-1) downto 0);
  signal Co, Ci, S      : std_logic;

begin

    -- Carga asincrona
    fa_with_shift_registers:
    process(CLK, loadData, RegA, RegB) is
    begin
    
      if (loadData = '1') then
        RA <= RegA;
        RB <= RegB;
        RO <= (others => '0');
      elsif (rising_edge(CLK)) then
        RA((N_BITS-1) downto 0)    <= '0' & RA((N_BITS-1) downto 1);
        RB((N_BITS-1) downto 0)    <= '0' & RB((N_BITS-1) downto 1);
        RO((N_BITS-1) downto 0)    <= S & RO((N_BITS-1) downto 1);
      end if;
    
    end process;

  PORTS_FA: 
    FA port map (
      inputA    => RA(0),
      inputB    => RB(0),
      carryIn   => Ci,
      diffEn    => diffEn,
      result    => S,
      carryOut  => Co
    );

    Ci <= '0' when loadData = '1' else Co when rising_edge(CLK);

    RegOut <= RO;

end A1;
