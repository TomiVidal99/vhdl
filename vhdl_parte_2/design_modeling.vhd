-- Modelo los retardos por diseño
library IEEE;
use IEEE.std_logic_1164.all;

entity design_modeling is
  GENERIC(
    QTOUTPUT : time := 20ns
  );
  PORT(
    i_d, i_set, i_clk     : IN  std_logic;
    output                : OUT std_logic
  );
end entity;

architecture a1 of design_modeling is
begin

  flipflopD:
  
  -- implementacion de un flip flop de tipo d
  flipflopD:
  process
    signal tempOutput: std_logic;
  begin
  
    if (i_clk'event and i_clk = '1') then -- espero a un flanco ascendente
      if (i_set = '1') then
        tempOutput <= i_d AFTER QTOUTPUT; -- el AFTER simula un retardo
      end if;
    end if;

    output <= tempOutput;
  
  end process;

end a1;
