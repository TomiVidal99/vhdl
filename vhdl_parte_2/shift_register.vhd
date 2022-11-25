-- Registro de desplazamiento de 8 bits con carga sincronica
library IEEE;
use IEEE.std_logic_1164.all;

entity shift_register is
PORT(
  preload       : IN std_logic_vector(7 downto 0);
  clk, preset   : IN  std_logic;
  output        : OUT std_logic
);
end entity;

architecture a1 of shift_register is
  signal reg: std_logic_vector(7 downto 0);
begin

  shift_register:
  process(clk)
  begin
    if (clk'event and clk = '1') then
      if (preset = '1') then
        reg <= preload;
      else
        reg <= reg(6 downto 0) & '0';
      end if;
    end if;
  end process;

  output <= reg(7);

end a1;
