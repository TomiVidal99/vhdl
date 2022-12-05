LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_signed.ALL;

ENTITY counter IS
  PORT (
    CLOCK_50 : IN STD_LOGIC; -- reloj interno de la FPGA de 50Mhz
    SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- SW(0) switch de pausa
    BUTTON0 : IN STD_LOGIC; -- botón de reset
    HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 1
    HEX1 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 2
    HEX2 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 3
    HEX3 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 4
    HEX2_DP : OUT STD_LOGIC -- punto decimal del 3er display
  );
END ENTITY;

ARCHITECTURE A1 OF counter IS

  CONSTANT counterMaxCount : STD_LOGIC_VECTOR(13 DOWNTO 0) := "10011100001111";

  COMPONENT decoder7segments IS
    PORT (
      NUMBER : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      ENABLE : IN STD_LOGIC;
      DECIMAL : IN STD_LOGIC;
      OUTPUT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT frequencyDivider IS
    PORT (
      CLOCK_IN : IN STD_LOGIC;
      RESET : IN STD_LOGIC;
      CLOCK_OUT : OUT STD_LOGIC
    );
  END COMPONENT;

  -- señales internas
  SIGNAL counter : STD_LOGIC_VECTOR(13 DOWNTO 0); -- cuenta el tiempo que transcurre
  SIGNAL clk : STD_LOGIC; -- señal de 0,01s = 100hz

BEGIN

  -- Se suma 0,01 segundos a la cuenta hasta llegar a 99,99s
  PROCESS (clk, counter, SW(0))
  BEGIN

    IF (rising_edge(clk)) THEN
      -- todos los eventos son síncronos con el reloj

      -- Se reinicia el cronómetro, cuando se presiona el botón de RESET   
      IF (BUTTON0 = '1') THEN
        counter <= (OTHERS => '0');

        -- Si en conteo no llego al fin y el usuario habilita el conteo, se suma 0,01 al cronómetro
      ELSIF (SW(0) = '0' AND counter < counterMaxCount) THEN
        counter <= counter + '1';
      END IF;

    END IF;

  END PROCESS;

  -- primer display (muestra la unidad)
  d7s_0 : decoder7segments PORT MAP(
    NUMBER => counter(3 DOWNTO 0),
    ENABLE => '1',
    DECIMAL => '1',
    OUTPUT => HEX0
  );

  -- reloj de 100Hz
  clk100 : frequencyDivider PORT MAP(
    CLOCK_IN => CLOCK_50,
    RESET => BUTTON0,
    CLOCK_OUT => clk
  );

END A1;