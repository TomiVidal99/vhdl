library IEEE;
use IEEE.std_logic_1164.all;

entity tb_signal_generator is
end entity;

architecture rtl of tb_signal_generator is

  component signal_generator
    PORT(
      clk, reset  : IN  std_logic;
      ctrl        : IN  std_logic_vector(1 downto 0);
      output      : OUT std_logic
    );
  end component;

  signal clk: std_logic := '0';
  signal rst: std_logic := '1';
  signal ctrl: std_logic_vector(1 downto 0) := "00";
  signal sqr_wave: std_logic := '0';
begin

  -- conecto las señales con el componente
  uut: signal_generator port map (
   clk => clk,
   reset => rst,
   ctrl => ctrl,
   output =>sqr_wave 
  );
  
  -- defino el reloj de 100hz
  clk <= not(clk) after 5 ms;
  
  -- defino las señales de estimulo
  stims:
  process is
  begin

    -- reinicio la máquina al incio
    rst <= '1';
    wait for 10 ms; -- 1 pulso de rejoj
    rst <= '0';
    assert (sqr_wave = '0') 
      REPORT "Se esperaba que la salida fuera nivel BAJO" 
      SEVERITY ERROR;

    -- seteo la máquina para que tenga un ciclo de trabajo de 66,6%
    -- deberia obtener 2 pulsos en alto y 3 en bajo
    ctrl <= "00";

    -- espero medio periodo de para acomodar cuando se leen las señales
    -- porque la maquina cambia de estado en un pulso ascendente de reloj que ocurre a T/2.
    wait for 5 ms;

    wait for 10 ms; -- 1 pulso de rejoj
    assert (sqr_wave = '1')
      REPORT "Se esperaba que la salida fuera nivel ALTO" 
      SEVERITY ERROR;

    wait for 10 ms; -- 1 pulso de rejoj
    assert (sqr_wave = '1') 
      REPORT "Se esperaba que la salida fuera nivel ALTO" 
      SEVERITY ERROR;

    wait for 30 ms; -- 1 pulso de rejoj
    assert (sqr_wave = '0') 
      REPORT "Se esperaba que la salida fuera nivel BAJO" 
      SEVERITY ERROR;

    wait;
  
  end process;

end rtl;
