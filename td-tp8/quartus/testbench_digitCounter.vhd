LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_digitCounter IS
END ENTITY;

ARCHITECTURE A1 OF testbench_digitCounter IS
    COMPONENT digitCounter
        PORT (
            clk : IN STD_LOGIC;
            enabled : IN STD_LOGIC;
            reset : IN STD_LOGIC;
            maxCount : OUT STD_LOGIC;
            numberOUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL CLOCK_100 : STD_LOGIC := '0';
    SIGNAL RESET : STD_LOGIC := '0';
    SIGNAL ENABLED : STD_LOGIC := '0';
    SIGNAL C0 : STD_LOGIC := '0';
    SIGNAL C1 : STD_LOGIC := '0';
    SIGNAL D0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    SIGNAL D1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
BEGIN

    -- reloj de 100Hz
    CLOCK_100 <= NOT(CLOCK_100) AFTER 5 ms;

    -- instanciación del cronómetro
    uut1 : digitCounter PORT MAP(
        clk => CLOCK_100,
        enabled => ENABLED,
        reset => RESET,
        maxCount => C0,
        numberOUT => D0
    );
    uut2 : digitCounter PORT MAP(
        clk => C0,
        enabled => ENABLED,
        reset => RESET,
        maxCount => C1,
        numberOUT => D1
    );

    -- controlo cuando termina la cuenta
    ENABLED <= '0' WHEN (D0 = "1001" AND D1 = "1001") ELSE
        '1';

    -- se cuenta por 100 segundos y se espera que el contador quede en 99.99
    stimulus :
    PROCESS IS
    BEGIN

        RESET <= '1'; -- se activa el reset

        WAIT FOR 20 ms; -- se esperan 2 pulsos de reloj
        RESET <= '0'; -- se desactiva el reset

        WAIT FOR 10 ms; -- se espera un pulso
        ASSERT((D0 = "0001"))
        REPORT "Se esperaba que el contador sea 1" SEVERITY warning;

        WAIT FOR 90 ms; -- se esperan 9 pulsos de reloj
        ASSERT((D1 = "0001"))
        REPORT "Se esperaba que el contador sea 0" SEVERITY warning;

        WAIT;

    END PROCESS;

END A1;