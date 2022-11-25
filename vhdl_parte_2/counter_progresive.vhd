-- Contador binario progresivo de WIDTH bits con precarga y reset asincrónico.
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity counter_progresive is
GENERIC(
  WIDTH: integer := 32
);
PORT(
  CLK, RESET, LOAD  : IN    std_logic;
  DATA              : IN    unsigned(WIDTH-1 downto 0);
  OUTPUT            : OUT   unsigned(WIDTH-1 downto 0)
);
end entity;

architecture a1 of counter_progresive is
  signal counter: unsigned(WIDTH-1 downto 0);
begin

  process(CLK, RESET)
  begin
    if (RESET = '1') then
      counter <= (others => '0');
    elsif rising_edge(CLK) then
      if (LOAD = '1') then
        counter <= DATA;
      else
        counter <= counter + 1;
      end if;
    end if;
  end process;

  OUTPUT <= counter;

end a1;
