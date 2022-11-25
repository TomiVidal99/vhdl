-- Registro de 8 bits con RESET sincrónico, reloj de flanco ascendente
library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bits_register is
PORT(
  i_clk, i_rst    : IN  std_logic;
  i_data          : IN  std_logic_vector(0 to 7);
  o_data          : OUT std_logic_vector(0 to 7)
);
end entity;

architecture a1 of eight_bits_register is
begin

  
  -- implementacion del registro
  EightBitsRegister:
  process
  begin
  
    wait until (i_clk'event and i_clk = '1');
    if i_rst = '1' then
      o_data <= "00000000";
    else
      o_data <= i_data;
    end if;
  
  end process;

end a1;
