LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY testbench_counter IS
END ENTITY;

ARCHITECTURE A1 OF testbench_counter IS
    COMPONENT counter
        PORT (
            CLOCK_50 : IN STD_LOGIC; -- reloj interno de la FPGA de 50Mhz
            SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0); -- SW(0) switch de pausa
            LEDG : OUT STD_LOGIC_VECTOR(9 DOWNTO 0); -- LEDs, se usan para debugear
            HEX0_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 1
            HEX1_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 2
            HEX2_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 3
            HEX3_D : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); -- display 4
            HEX2_DP : OUT STD_LOGIC; -- punto decimal del 3er display

            CLOCK_100Hz : OUT STD_LOGIC;
            D0_COUNT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            D1_COUNT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            D2_COUNT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            D3_COUNT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    -- Procedure for clock generation
    PROCEDURE clk_gen(SIGNAL clk : OUT STD_LOGIC; CONSTANT FREQ : real) IS
        CONSTANT PERIOD : TIME := 1 sec / FREQ; -- Full period
        CONSTANT HIGH_TIME : TIME := PERIOD / 2; -- High time
        CONSTANT LOW_TIME : TIME := PERIOD - HIGH_TIME; -- Low time; always >= HIGH_TIME
    BEGIN
        -- Check the arguments
        ASSERT (HIGH_TIME /= 0 fs) REPORT "clk_plain: High time is zero; time resolution to large for frequency" SEVERITY FAILURE;
        -- Generate a clock cycle
        LOOP
            clk <= '1';
            WAIT FOR HIGH_TIME;
            clk <= '0';
            WAIT FOR LOW_TIME;
        END LOOP;
    END PROCEDURE;

    SIGNAL clk50 : STD_LOGIC := '0';
    SIGNAL switches : STD_LOGIC_VECTOR(9 DOWNTO 0);
    SIGNAL display0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL display1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL display2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL display3 : STD_LOGIC_VECTOR(6 DOWNTO 0);

    SIGNAL clk100hz: STD_LOGIC;
    SIGNAL d0: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL d1: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL d2: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL d3: STD_LOGIC_VECTOR(3 downto 0);

BEGIN

    -- instanciación del cronómetro
    counterInstance : counter PORT MAP(
        CLOCK_50 => clk50,
        SW => switches,
        HEX0_D => display0,
        HEX1_D => display1,
        HEX2_D => display2,
        HEX3_D => display3,
        CLOCK_100Hz => clk100hz,
        D0_COUNT => d0,
        D1_COUNT => d1,
        D2_COUNT => d2,
        D3_COUNT => d3
    );

    clk_gen(clk50, 50.000E6); -- 50.000 MHz clock

    ---- se crea el reloj de 50MHz
    --clock50 :
    --PROCESS IS
    --BEGIN
    --    clk50 <= NOT(clk50) AFTER 10 ns;
    --    WAIT;
    --END PROCESS;

    -- se cuenta por 100 segundos y se espera que el contador quede en 99.99
    uut :
    PROCESS IS
    BEGIN

        switches <= "1000000000"; -- se activa el reset
        WAIT FOR 100 ms; -- se espera un pulso de reloj
        switches <= "0000000000"; -- se desactiva el reset
        WAIT FOR 100 ms; -- se espera un pulso de reloj
        ASSERT((display0 = "1111001"))
        REPORT "Se esperaba que el display 0 muestre un '1'" SEVERITY warning;
        WAIT;

    END PROCESS;

END A1;
