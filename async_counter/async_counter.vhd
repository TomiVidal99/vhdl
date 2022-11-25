-- Contador de 3 bits, asincrono, con enable asincrono y carga de numero asincrona.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity async_counter is
  PORT(
    i_clk, i_enable, i_preset_en, i_reset      : IN  std_logic;
    i_preset                                   : IN integer range 0 to 15;
    o_count                                    : OUT integer range 0 to 15
  );
end entity;

architecture A1 of async_counter is
begin
  
  async_counter_async_enable:
  process(i_clk, i_enable, i_preset_en, i_reset) is
    variable temp_data : integer range 0 to 15 := 0;
  begin
  
    if (i_enable = '1') then

      -- cargo un numero antes de empezar a contar
      if (i_preset_en = '1') then
        temp_data := i_preset;

      elsif (i_reset = '1') then
        -- pongo en 0 la salida
        temp_data := 0;

      else

        -- comienza el conteo
        if (rising_edge(i_clk)) then
            temp_data := temp_data + 1;
        end if;

      end if;


    end if;
  
      o_count <= temp_data;

  end process;


end A1;
