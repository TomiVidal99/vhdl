LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_signed.ALL;

ENTITY counter IS
  PORT (
    CLOCK_50 : IN STD_LOGIC; -- reloj interno de la FPGA de 50Mhz
    SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- SW(0) switch de pausa
	 LEDG: OUT STD_LOGIC_VECTOR(9 downto 0);
    BUTTON2 : IN STD_LOGIC; -- botón de reset
    HEX0_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 1
    HEX1_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 2
    HEX2_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 3
    HEX3_D: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 4
    HEX2_DP : OUT STD_LOGIC -- punto decimal del 3er display
  );
END ENTITY;

ARCHITECTURE A1 OF counter IS

  CONSTANT counterMaxCount : STD_LOGIC_VECTOR(13 DOWNTO 0) := "10011100001111";
  CONSTANT digitMaxCount : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";

  COMPONENT digitCounter is
    GENERIC (
        MAX_COUNT : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001"
    );
    PORT (
        clk : IN STD_LOGIC;
		  reset    : IN STD_LOGIC;
		  maxCount : OUT STD_LOGIC;
        numberOUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  end COMPONENT;

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
  SIGNAL clk : STD_LOGIC; -- señal de 0,01s = 100hz

  SIGNAL unit1, unit2, unit3, unit4  : STD_LOGIC_VECTOR(3 downto 0);
  SIGNAL C1, C2, C3, C4  : STD_LOGIC;
  
  signal counterDiv: integer;
  signal counter	: 	std_logic_vector(3 downto 0);
  
BEGIN

  -- se cuenta la unidad
  unitCounter1 : digitCounter PORT MAP(
    clk => clk and unit4 = "1001" and unit3 = "1001" and unit2 = "1001" and unit1 = "1001",
	 reset => SW(9),
	 maxCount => C1,
    numberOUT => unit1
  );
  
  -- se cuenta la unidad
  unitCounter2 : digitCounter PORT MAP(
    clk => C1,
	 	 reset => SW(9),
	 maxCount => C2,
    numberOUT => unit2
  );
  
  -- se cuenta la unidad
  unitCounter3 : digitCounter PORT MAP(
    clk => C2,
	 	 reset => SW(9),
	 maxCount => C3,
    numberOUT => unit3
  );
-- se cuenta la unidad
  unitCounter4 : digitCounter PORT MAP(
    clk => C3,
	 	 reset => SW(9),
		 maxCount => C4,
    numberOUT => unit4
  );
  -- primer display (muestra la unidad)
  d7s_0 : decoder7segments PORT MAP(
    NUMBER => unit1,
    ENABLE => '1',
    DECIMAL => '1',
    OUTPUT => HEX0_D
  );
  -- primer display (muestra la unidad)
  d7s_1 : decoder7segments PORT MAP(
    NUMBER => unit2,
    ENABLE => '1',
    DECIMAL => '1',
    OUTPUT => HEX1_D
  );

  -- primer display (muestra la unidad)
  d7s_2 : decoder7segments PORT MAP(
    NUMBER => unit3,
    ENABLE => '1',
    DECIMAL => '1',
    OUTPUT => HEX2_D
  );

  -- primer display (muestra la unidad)
  d7s_3 : decoder7segments PORT MAP(
    NUMBER => unit4,
    ENABLE => '1',
    DECIMAL => '1',
    OUTPUT => HEX3_D
  );


  freqDivider :
  PROCESS (CLOCK_50) IS
  BEGIN

    IF (rising_edge(CLOCK_50)) THEN
      -- sincrono con el reloj de entrada (50MHz)
      IF (SW(8) = '1') THEN
        counterDiv <= 0;
      ELSIF (counterDiv < 250000) THEN
        counterDiv <= counterDiv + 1;
      ELSE
        counterDiv <= 0;
        clk <= NOT(clk);
      END IF;

    END IF;

  END PROCESS;
  
  
  -- reloj de 100Hz
--  clk100 : frequencyDivider PORT MAP(
--    CLOCK_IN => CLOCK_50,
--    RESET => SW(9),
--    CLOCK_OUT => clk
--  );
  
  
  LEDG(0) <= clk;
  LEDG(8 downto 5) <= unit1;
  LEDG(9) <= SW(9);
  
  HEX2_DP <= '0';
  

END A1;
