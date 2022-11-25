library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity tb_async_counter is
end entity;

architecture A1 of tb_async_counter is

  component async_counter
    PORT(
      i_clk, i_enable, i_preset_en, i_reset      : IN  std_logic;
      i_preset                                   : IN integer range 0 to 15;
      o_count                                    : OUT integer range 0 to 15 
    );
  end component;

  signal i_clk, i_enable, i_preset_en, i_reset : std_logic;
  signal i_preset                              : integer range 0 to 15;
  signal o_count                               : integer range 0 to 15;

begin

  -- se definen la relacion de puertos
  uut: async_counter port map (
    i_clk => i_clk,
    i_enable => i_enable,
    i_preset_en => i_preset_en,
    i_reset => i_reset,
    i_preset => i_preset,
    o_count => o_count
  );

  
  -- se hace el test bench
  estimulos:
  process
    variable toggler : std_logic := '0';
  begin
  
    wait for 500 ns;

    i_enable <= '1';
    i_preset_en <= '0';
    i_reset <= '0';
    i_preset <= 0;

    for i in 0 to 15 loop
      toggler := not(toggler);
      wait for 10 ns;
      i_clk <= toggler;
    end loop;

    wait for 50 us;
  
  end process;

end A1;
