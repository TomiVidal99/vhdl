-- test bench para la implementacion
-- de un sumador serie de 8 bits

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_practica1 is
  GENERIC(
    N_BITS : integer := 8
  );
end entity;

architecture rtl of tb_practica1 is

  component practica1 is
    GENERIC(
      N_BITS : integer := 8
    );
    PORT(
      i_clk, i_reset, i_enabled  : IN  std_logic;
      i_regA, i_regB             : IN  std_logic_vector((N_BITS-1) downto 0);
      o_sum                      : OUT std_logic_vector((N_BITS-1) downto 0)
    );
  end component;

  signal clk, reset, enabled  : std_logic;
  signal regA, regB, regSum   : std_logic_vector((N_BITS-1) downto 0);

begin

  UUT: practica1
  generic map(
    N_BITS => N_BITS
  )
  port map(
    i_clk => clk,
    i_reset => reset,
    i_enabled => enabled,
    i_regA => regA,
    i_regB => regB,
    o_sum => regSum,
  );

end architecture rtl;
