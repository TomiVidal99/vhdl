library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- CLOCK_50 es el reloj interno de la FPGA que oscila a 50MHz
-- Los otros pines corresponden a leds y switches. (vea el archivo .qsf)

entity ej4 is
  PORT(
    CLOCK_50   : IN  std_logic;
    PIN_G5     : IN  std_logic;
    PIN_H7     : IN  std_logic;
    PIN_C2     : OUT  std_logic;
    PIN_C1     : OUT  std_logic;
    PIN_E1     : OUT  std_logic;
    PIN_F2     : OUT  std_logic
  );
end entity;

architecture A1 of ej4 is
  signal counter      : natural    := 0;
  signal clk          : std_logic  := '0';
  signal counterBits  : std_logic_vector(25 downto 0);
begin

  
  -- se implementa el reloj que oscila a 0,5hz
  clk05hz:
  process(CLOCK_50) is
  begin


    -- si el contador llega a 100M entonces el clk debe oscilar
    if (rising_edge(CLOCK_50)) then

      if (PIN_G5 = '0') then
        counter <= 0;
        clk <= '0';
      elsif (counter > 50000000 AND PIN_H7 = '0') then
        clk <= not(clk);
        counter <= 0;
      elsif (PIN_H7 = '0') then
        counter <= counter + 1;
      end if;

      counterBits <= std_logic_vector(to_unsigned(counter, counterBits'length));

    end if;
  
  end process;

  PIN_C2 <= counterBits(25);
  PIN_C1 <= counterBits(24);
  PIN_E1 <= counterBits(23);
  PIN_F2 <= counterBits(22);

end A1;
