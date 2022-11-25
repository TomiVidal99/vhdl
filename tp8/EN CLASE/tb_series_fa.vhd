-- Test bench para el sumador de N bits a partir de FA en serie

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity tb_series_fa is
  generic(
    N: integer := 8
         );
end entity;

architecture A1 of tb_series_fa is

  component series_fa
    generic(
      N : integer := N
    );
    port(
      -- INPUTS
      clk, loadEnabled                    : IN    std_logic;
      numberA, numberB                    : IN    std_logic_vector( (N-1) downto 0 );

      -- OUTPUTS
      sum                                 : OUT   std_logic_vector( (N-1) downto 0 )
    );
  end component;

  signal clk, loadEnabled     : std_logic;
  signal x, y, resultado      : std_logic_vector( (N-1) downto 0 );

begin

  PORTS_SERIES_FA: series_fa port map(
    clk           => clk, 
    loadEnabled   => loadEnabled,
    numberA       => x,
    numberB       => y,
    sum           => resultado
  );

  -- Reloj de 200ns de periodo y 50% ciclo de trabajo
  clock:
  process is
  begin
    clk <= '0';
    wait for 100 ns;
    clk <= '1';
    wait for 100 ns;
  end process clock;
  
  -- Se resetean los datos iniciales
  reset_data:
  process is
  begin
    loadEnabled <= '1';
    wait for 200 ns;
    loadEnabled <= '0';
    wait for 4 us;
  end process reset_data;

  
  -- Se cargan los numeros
  load_data:
  process is
  begin
    x <= "00001111";
    y <= "00000001";
    wait for 200 ns; -- se espera la carga de los datos
    wait for 1600 ns; -- se espera a que los shift register operen
    assert resultado = "00010000";
    report "Finished";
    wait for 4 us;
  end process load_data;

end A1;
