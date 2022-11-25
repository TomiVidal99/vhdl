-- Ejercicio 2 del TP 7

-- BUTTON active low
-- SW active high

library IEEE;
use IEEE.std_logic_1164.all;

entity ej2 is
  PORT(
    BUTTON    : IN  std_logic_vector(0 downto 2);
    SW        : IN  std_logic_vector(9 downto 0);
    LEDG      : OUT std_logic_vector(9 downto 0)
  );
end entity;

architecture A1 of ej2 is
begin

  
  p1:
  process(SW, BUTTON) is
  begin
  
    if (SW(4) = '1' AND BUTTON(2) = '0') then
      LEDG(1 downto 0) <= (others => '1');
      LEDG(9 downto 2) <= (others => '0');
    else
      LEDG(9 downto 0) <= (others => '0');
    end if;
  
  end process;

end A1;
