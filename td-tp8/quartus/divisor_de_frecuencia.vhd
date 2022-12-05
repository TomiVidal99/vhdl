library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

-- TODO agregar el punto decimal

entity divisor_de_frecuencia is
  generic (
      MAX_COUNT: integer := 250000
    );
    port (
      CLOCK     :       IN  std_logic;
      RESET     :       IN  std_logic;
      SALIDA    :       OUT std_logic
    );
end entity;

architecture A1 of divisor_de_frecuencia is

  signal clk     : std_logic;
  signal counter : integer;

begin
  
   -- divisor de frecuencia
  divisorFrecuencia:
  process(CLOCK) is
  begin
  
    if (rising_edge(CLOCK)) then
    -- sincrono con el reloj de 50MHz
      if (RESET = '1') then
        counter <= 0;
      elsif (counter < MAX_COUNT) then
        counter <= counter + 1;
      else
        counter <= 0;
        clk <= not(clk);
      end if;

    end if;
  
  end process;

  SALIDA <= clk;
  
end A1;