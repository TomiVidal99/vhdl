-- implemento un sumador serie de 8 bits
-- reset activo en alto
-- enabled activo en alto, es decir se pone en pausa si i_enabled es cero

library IEEE;
use IEEE.std_logic_1164.all;

entity practica1 is
  GENERIC(
    N_BITS : integer := 8
  );
  PORT(
    i_clk, i_reset, i_enabled  : IN  std_logic;
    i_regA, i_regB             : IN  std_logic_vector((N_BITS-1) downto 0);
    o_sum                      : OUT std_logic_vector((N_BITS-1) downto 0)
  );
end entity;

architecture rtl of practica1 is
  component FA
    PORT(
      i_A, i_B, i_carry  : IN  std_logic;
      o_sum, o_carry     : OUT std_logic
    );
  end component;

  signal Cin, Cout          : std_logic := '0';
  signal regA, regB, regSum : std_logic_vector((N_BITS-1) downto 0) := (others => '0');

begin

  -- Instancio el full adder
  FullAdder: FA port map(
    i_A => i_regA(0),
    i_B => i_regB(0),
    i_carry => Cin,
    o_sum => regSum(N_BITS-1),
    o_carry => Cout
  );

  -- A cada flanco ascendente de reloj opero la suma
  SERIAL_SUM: process(i_clk, i_regA, i_regB, i_enabled, i_reset) is
  begin

    if (i_reset = '1') then
      o_sum <= (others => '0');
      Cout <= '0';
    elsif (rising_edge(i_clk) and i_enabled = '1') then
      -- hago la suma
      Cout <= Cin;
      -- hago un shift de los registros
      regA    <= '0' & regA((N_BITS-1) downto 1);
      regB    <= '0' & regB((N_BITS-1) downto 1);
      regSum  <= '0' & regSum((N_BITS-1) downto 1);
    end if;

  end process;

end architecture rtl;
