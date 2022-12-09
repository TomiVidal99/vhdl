LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_counter IS
END ENTITY;

ARCHITECTURE counter_arch OF testbench_counter IS
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

    SIGNAL switches : STD_LOGIC_VECTOR(9 DOWNTO 0) := "0000000000";
    SIGNAL display0 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
    SIGNAL display1 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
    SIGNAL display2 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";
    SIGNAL display3 : STD_LOGIC_VECTOR(6 DOWNTO 0) := "0000000";

    SIGNAL clk100hz : STD_LOGIC := '0';
    SIGNAL d0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL d1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL d2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL d3 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

    SIGNAL CLOCK50MHz : STD_LOGIC := '0';

BEGIN

    -- reloj de 50MHz
    CLOCK50MHz <= NOT(CLOCK50MHz) AFTER 10 ns;

    -- se cuenta por 100 segundos y se espera que el contador quede en 99.99
    stimulus :
    PROCESS IS
    BEGIN

        switches(9) <= '1'; -- se activa el reset del reloj de 100Hz
        WAIT FOR 20 ns; -- se espera un pulso de reloj del de 50MHz
        switches(9) <= '0'; -- se desactiva el reset del reloj de 100Hz
        switches(9) <= '1'; -- se activa el reset de los contadores por un cliclo de reloj del de 100Hz
        WAIT FOR 20 ns; -- se espera un pulso de reloj del de 100Hz
        switches(9) <= '0'; -- se desactiva el reset asi los contadores comienzan a contar
        WAIT FOR 20 ps; -- se espera un pulso de reloj del de 100Hz

        WAIT;

    END PROCESS;

    -- instanciación del cronómetro
    uut : counter PORT MAP(
        CLOCK_50 => CLOCK50MHz,
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

END counter_arch;
