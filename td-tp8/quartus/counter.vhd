LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_signed.ALL;

ENTITY counter IS
  PORT (
    CLOCK_50 : IN STD_LOGIC; -- reloj interno de la FPGA de 50Mhz
    SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- SW(0) switch de pausa
    BUTTON0 : IN STD_LOGIC; -- botón de inicio
    BUTTON1 : IN STD_LOGIC; -- botón de reset
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
      entrada : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      habilitado : IN STD_LOGIC;
      decimal : IN STD_LOGIC;
      salida : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT frequencyDivider IS
    PORT (
      CLOCK : IN STD_LOGIC;
      RESET : IN STD_LOGIC;
      SALIDA : OUT STD_LOGIC
    );
  END COMPONENT;

  -- señales internas
  SIGNAL counter : STD_LOGIC_VECTOR(13 DOWNTO 0); -- cuenta el tiempo que transcurre
  SIGNAL clk : STD_LOGIC; -- señal de 0,01s = 100hz
  SIGNAL canCount : STD_LOGIC; -- señal de control que permite habilitar la cuenta o no, para dar sentido de un comienzo y un fin

BEGIN

  -- RESETEO
  PROCESS (BUTTON1, counter, canCount) IS
  BEGIN

    IF (BUTTON1 = '1') THEN
      counter <= (OTHERS => '0');
      canCount <= '0';
    END IF;
  END PROCESS;

  -- START
  PROCESS (clk, BUTTON0)
  BEGIN

    IF (rising_edge(clk) AND BUTTON0 = '1') THEN
      canCount <= '1';
      counter <= (OTHERS => '0');
    END IF;

  END PROCESS;

  -- Se suma 0,01 segundos a la cuenta hasta llegar a 99,99s
  PROCESS (clk, canCount, counter, SW(0))
  BEGIN

    IF (rising_edge(clk) AND SW(0) = '0' AND canCount = '1' AND counter < counterMaxCount) THEN
      counter <= counter + '1';
    END IF;

  END PROCESS;

  -- primer display (muestra la unidad)
  d7s_0 : decoder7segments PORT MAP(
    entrada => counter(3 DOWNTO 0),
    habilitado => '1',
    decimal => '1',
    salida => HEX0
  );

  -- reloj de 100Hz
  clk100 : frequencyDivider PORT MAP(
    CLOCK => CLOCK_50,
    RESET => BUTTON1,
    SALIDA => clk
  );

END A1;