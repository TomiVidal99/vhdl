-- N bits adder with a full adder design in series with shift register

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity series_fa is
  GENERIC(
    N : integer := 8
  );
  PORT(
    -- INPUTS
    clk, loadEnabled                    : IN    std_logic;
    numberA, numberB                    : IN    std_logic_vector( (N-1) downto 0 );

    -- OUTPUTS
    tS : OUT std_logic;
    sum, tA, tB, t0                                 : OUT   std_logic_vector( (N-1) downto 0 )
  );
end entity;

architecture A1 of series_fa is

  component FA
    PORT(
    -- INPUTS
    inputA      : IN  std_logic;
    inputB      : IN  std_logic;
    carryIn     : IN  std_logic;

    -- OUTPUTS
    sum         : OUT std_logic;
    carryOut    : OUT std_logic
  );
  end component;

  signal regA, regB, regOut          :   std_logic_vector( (N-1) downto 0 );
  signal auxCi, auxCo, auxSum, tempC, tempA, tempB :   std_logic;

begin

  PORTS_FA: 
    FA port map ( 
      inputA => tempA,
      inputB => tempB,
      carryIn => auxCi,
      carryOut => auxCo,
      sum => auxSum
    );

  tempA <= regA(0);
  tempB <= regB(0);

  process(clk, loadEnabled) is
  begin

    if (loadEnabled = '1') then
      -- load the numbers to the registers
      regA    <= numberA;
      regB    <= numberB;
      regOut  <= (others => '0');
      auxCi   <= '0';
    elsif (falling_edge(clk)) then

      regOut((N-1) downto 0)  <= regOut((N-2) downto 0) & auxSum;
      auxCi   <= auxCo;

      regA    <= '0' & regA((N-1) downto 1);
      regB    <= '0' & regB((N-1) downto 1);

    end if;
  
  end process;

  sum <= regOut;
  tA <= regA;
  tB <= regB;
  t0 <= regOut;
  tS <= auxSum;

end A1;
