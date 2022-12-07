LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_freqDivider IS
END ENTITY;

ARCHITECTURE A1 OF testbench_freqDivider IS
    COMPONENT digitCounter
        PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        maxCount : OUT STD_LOGIC;
        numberOUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL CLOCK_100 : STD_LOGIC := '0';
    SIGNAL RESET : STD_LOGIC := '0';
    SIGNAL MAX_COUNT : STD_LOGIC := '0';
    SIGNAL NUMBER : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";


BEGIN

    -- reloj de 100Hz
    CLOCK_100 <= NOT(CLOCK_100) AFTER 5 ms;
    
    -- se cuenta por 100 segundos y se espera que el contador quede en 99.99
    stimulus :
    PROCESS IS
    BEGIN

        RESET <= '1'; -- se activa el reset

        WAIT FOR 20 ms; -- se esperan 2 pulsos de reloj
        RESET <= '0'; -- se desactiva el reset

        WAIT FOR 10 ms; -- se espera un pulso
        ASSERT((NUMBER = "0001"))
        REPORT "Se esperaba que el contador sea 1" SEVERITY warning;

        WAIT FOR 90 ms; -- se esperan 9 pulsos de reloj
        ASSERT((NUMBER = "0001"))
        REPORT "Se esperaba que el contador sea 0" SEVERITY warning;
        ASSERT((MAX_COUNT = '1'))
        REPORT "Se esperaba que se haya llegado a la cuenta maxima" SEVERITY warning;

        WAIT;

    END PROCESS;

    -- instanciación del cronómetro
    uut : digitCounter PORT MAP(
        clk => CLOCK_100,
        reset => RESET,
        maxCount => MAX_COUNT,
        numberOUT => NUMBER
    );

END A1;