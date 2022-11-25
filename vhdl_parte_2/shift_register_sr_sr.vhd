-- Registro de desplazamiento serie-serie de N bits
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity shift_register_sr_sr is
  GENERIC(
    N : integer := 63
  );
  PORT(
    indata, clk, enable     : IN  std_logic;
    odata                   : OUT std_logic
  );
end entity;

architecture a1  of shift_register_sr_sr is
  type data_bus is array (N downto 0) of std_logic;
  signal data: data_bus;
begin

  serial_serial:
  process(clk)
  begin
    if (rising_edge(clk)) then
      if (enable = '1') then
        data(N downto 1) <= data(N-1 downto 0);
        data(0) <= indata;
      end if;
    end if;
  end process;

  odata <= data(N-1);

end a1;
