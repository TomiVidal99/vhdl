LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_signed.ALL;

-- TODO: pensar como sincronizar todo con un solo reset,
-- ahora se usa el SW(8) para sincronizar el reloj de 100Hz
-- y el SW(9) para resetear los contadores
-- TODO: haciendo test benches me di cuenta que los reset de los displays
-- no estan bien hechos, porque deberian ser asincronos, ya que los carrys son 
-- los relojes, por lo que nunca se resetean hasta que el contador llegue a 99 segundos,
-- que no es aceptable.

ENTITY counter IS
  PORT (

    -- Entradas (internas en la FPGA)
    CLOCK_50 : IN STD_LOGIC; -- reloj interno de la FPGA de 50Mhz
    SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- SW(0) switch de pausa

    -- Salidas (internas en la FPGA)
    LEDG : OUT STD_LOGIC_VECTOR(9 DOWNTO 0); -- LEDs, se usan para debugear
    HEX0_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 1
    HEX1_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 2
    HEX2_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 3
    HEX3_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 4
    HEX2_DP : OUT STD_LOGIC; -- punto decimal del 3er display

    -- Salidas para los test bench
    CLOCK_100Hz : OUT STD_LOGIC;
    D0_COUNT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    D1_COUNT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    D2_COUNT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    D3_COUNT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    C0_COUNT : OUT STD_LOGIC;
    C1_COUNT : OUT STD_LOGIC;
    C2_COUNT : OUT STD_LOGIC;
    C3_COUNT : OUT STD_LOGIC

  );
END ENTITY;

ARCHITECTURE counter_arch OF counter IS

  -- CONSTANT digitMaxCount : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";

  -- Este componente se encarga de contar el digito de un display.
  COMPONENT digitCounter IS
    PORT (
      clk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      maxCount : OUT STD_LOGIC;
      numberOut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  -- Este componente se encarga de tomar un numero de binario de 4 bits 
  -- y convertirlo a una señal de 7 bits para un display de 7 segmentos.
  COMPONENT decoder7segments IS
    PORT (
      NUMBER : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      ENABLE : IN STD_LOGIC;
      OUTPUT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
  END COMPONENT;

  -- Este componente se encarga de tomar una señal de reloj y emitir
  -- una nueva de menor frecuencia (en este caso 100Hz).
  COMPONENT frequencyDivider IS
    PORT (
      CLOCK_IN : IN STD_LOGIC;
      RESET : IN STD_LOGIC;
      CLOCK_OUT : OUT STD_LOGIC
    );
  END COMPONENT;

  -- señales internas:
  SIGNAL clk_100 : STD_LOGIC := '0'; -- señal de 0,01s = 100hz

  -- numeros decimales que se muestran en los displays
  SIGNAL decimalDisplay0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL decimalDisplay1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL decimalDisplay2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
  SIGNAL decimalDisplay3 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

  -- carrys de la salida de los contadores de cada display (se dispara durante un 
  -- ciclo de reloj cuando se llega a 9, si se quisiera un contador octal, el mismo
  -- se podria disparar cuando llega a 7)
  SIGNAL C0 : STD_LOGIC := '0';
  SIGNAL C1 : STD_LOGIC := '0';
  SIGNAL C2 : STD_LOGIC := '0';
  SIGNAL C3 : STD_LOGIC := '0';

  SIGNAL clockFirstCounter : STD_LOGIC := '0';

BEGIN

  -- reloj de 100Hz
  clk100 : frequencyDivider PORT MAP(
    CLOCK_IN => CLOCK_50,
    RESET => SW(9),
    CLOCK_OUT => clk_100
  );

  -- - - - - - - - - - -  CONTADORES - - - - - - - - - - 
  clockFirstCounter <= clk_100 AND NOT(C3 AND C2 AND C1 AND C0); -- esto es para que pare cuando llega al maximo
  -- Se cuentan los 1/100 segundos
  displayCounter0 : digitCounter PORT MAP(
    clk => clockFirstCounter,
    reset => SW(9),
    maxCount => C0,
    numberOut => decimalDisplay0
  );
  -- Se cuentan los 1/10 segundos
  displayCounter1 : digitCounter PORT MAP(
    clk => C0,
    reset => SW(9),
    maxCount => C1,
    numberOut => decimalDisplay1
  );
  -- Se cuentan los segundos
  displayCounter2 : digitCounter PORT MAP(
    clk => C1,
    reset => SW(9),
    maxCount => C2,
    numberOut => decimalDisplay2
  );
  -- Se cuentan las decenas de segundos
  displayCounter3 : digitCounter PORT MAP(
    clk => C2,
    reset => SW(9),
    maxCount => C3,
    numberOut => decimalDisplay3
  );

  -- - - - - - - - - - -  DISPLAYS - - - - - - - - - - 
  -- primer display (muestra la centésima de segundo)
  HEX2_DP <= '0'; -- el punto decimal en el medio, siempre activo.
  d7s_0 : decoder7segments PORT MAP(
    NUMBER => decimalDisplay0,
    ENABLE => '1',
    OUTPUT => HEX0_D
  );
  -- primer display (muestra la décima de segundo)
  d7s_1 : decoder7segments PORT MAP(
    NUMBER => decimalDisplay1,
    ENABLE => '1',
    OUTPUT => HEX1_D
  );
  -- primer display (muestra la unidad de segundo)
  d7s_2 : decoder7segments PORT MAP(
    NUMBER => decimalDisplay2,
    ENABLE => '1',
    OUTPUT => HEX2_D
  );
  -- primer display (muestra la decena de segundo)
  d7s_3 : decoder7segments PORT MAP(
    NUMBER => decimalDisplay3,
    ENABLE => '1',
    OUTPUT => HEX3_D
  );

  -- - - - - - - - - - -  UTILIDADES DE DEBUG - - - - - - - - - - 
  LEDG(0) <= clk_100; -- se muestra el reloj de 100hz, en el primer LED
  LEDG(8) <= SW(0); -- muestra si se activa o no el switch de pausa (habilitado), en el anteúltimo LED.
  LEDG(9) <= SW(9); -- muestra si se activa o no el switch de reset, en el último LED.

  -- conecto las salidas para debugear con los test bench
  CLOCK_100Hz <= clk_100;
  D0_COUNT <= decimalDisplay0;
  D1_COUNT <= decimalDisplay1;
  D2_COUNT <= decimalDisplay2;
  D3_COUNT <= decimalDisplay3;
  C0_COUNT <= C0;
  C1_COUNT <= C1;
  C2_COUNT <= C2;
  C3_COUNT <= C3;

END counter_arch;