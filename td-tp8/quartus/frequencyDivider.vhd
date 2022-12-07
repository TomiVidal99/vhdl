LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_signed.ALL;

-- Se crea implementa un divisor de frecuencia, que toma una entrada de reloj
-- y la retrasa para obtener una señal de reloj de menor frecuencia.
-- la frecuencia por defecto de la salida es de 100Hz, si la entrada es de 50MHz.

ENTITY frequencyDivider IS
  GENERIC (
    MAX_COUNT : INTEGER := 250000
  );
  PORT (
    CLOCK_IN : IN STD_LOGIC;
    RESET : IN STD_LOGIC;
    CLOCK_OUT : OUT STD_LOGIC
  );
END ENTITY;

ARCHITECTURE freqDivider_arch OF frequencyDivider IS

  SIGNAL clk : STD_LOGIC := '0';
  SIGNAL counter : INTEGER := 0;

BEGIN

  freqDivider :
  PROCESS (CLOCK_IN) IS
  BEGIN

    IF (rising_edge(CLOCK_IN)) THEN
      -- sincrono con el reloj de entrada (50MHz)
      IF (RESET = '1') THEN
        counter <= 0;
      ELSIF (counter < MAX_COUNT) THEN
        counter <= counter + 1;
      ELSE
        counter <= 0;
        clk <= NOT(clk);
      END IF;

    END IF;

  END PROCESS;

  CLOCK_OUT <= clk;

END freqDivider_arch;

-- codigo que habia antes en el main
--  freqDivider :
--  PROCESS (CLOCK_50) IS
--  BEGIN
--
--    IF (rising_edge(CLOCK_50)) THEN
--      -- sincrono con el reloj de entrada (50MHz)
--      IF (SW(8) = '1') THEN
--        counterDiv <= 0;
--      ELSIF (counterDiv < 250000) THEN
--        counterDiv <= counterDiv + 1;
--      ELSE
--        counterDiv <= 0;
--        clk <= NOT(clk);
--      END IF;
--
--    END IF;
--
--  END PROCESS;