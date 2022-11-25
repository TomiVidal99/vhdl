library IEEE;
use IEEE.std_logic_1164.all;

entity p2 is
  PORT(
    i_d, i_clk    : IN  std_logic;
    o_q           : OUT std_logic
  );
end entity;

architecture tipo_reloj1 of p2 is
  signal tempQ: std_logic;
begin
  
  -- implementacion de flip flip tipo d con flaco ascendente
  --ff_d:
  --process is
  --begin
  --
  --  wait until i_clk = '1'; o_q <= i_d; -- sensible a flanco ascendente
  --
  --end process;

-- OTRA FORMA DE DECLARAR EL FLANCO ASCENDENTE
  
  ff_d1:
  process is
  begin
    if i_clk'event and i_clk = '1' then
      o_q <= i_d;
    end if;
  end process;
  
end;
