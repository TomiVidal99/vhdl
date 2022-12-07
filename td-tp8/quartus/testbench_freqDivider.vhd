LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_freqDivider IS
END ENTITY;

ARCHITECTURE freqDivider_arch OF testbench_freqDivider IS
    COMPONENT frequencyDivider
        GENERIC (
            MAX_COUNT : INTEGER := 250000
        );
        PORT (
            CLOCK_IN : IN STD_LOGIC;
            RESET : IN STD_LOGIC;
            CLOCK_OUT : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL CLOCK_50MHz : STD_LOGIC := '0';
    SIGNAL CLOCK_100Hz : STD_LOGIC := '0';
    SIGNAL RESET : STD_LOGIC := '0';

BEGIN

    -- reloj de 50MHz
    CLOCK_50MHz <= NOT(CLOCK_50MHz) AFTER 10 ns;
    -- resetea la señal durante un pulso de reloj
    resetDivisor :
    PROCESS IS
    BEGIN

        RESET <= '1';
        WAIT FOR 20 ns;
        RESET <= '0';
        WAIT;

    END PROCESS;

    -- instanciación del divisor de frecuencia
    uut : frequencyDivider
    GENERIC MAP(
        MAX_COUNT => 250000
    )
    PORT MAP(
        CLOCK_IN => CLOCK_50MHz,
        RESET => RESET,
        CLOCK_OUT => CLOCK_100Hz
    );

END freqDivider_arch;