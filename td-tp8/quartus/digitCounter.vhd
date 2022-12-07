LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

-- Este componente permite contar y volver a principio
-- cuando se llega al limite 'MAX_COUNT'

ENTITY digitCounter IS
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        maxCount : OUT STD_LOGIC;
        numberOut : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE A1 OF digitCounter IS
    SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL hitMax : STD_LOGIC;
BEGIN
    mainProcess :
    PROCESS (clk) IS
    BEGIN

        IF (reset = '1') THEN
            -- reset asincrono
            count <= (OTHERS => '0');
            hitMax <= '0';

            -- sincrono con el reloj
        ELSIF (rising_edge(clk)) THEN
            IF (count = 9) THEN
                count <= (OTHERS => '0'); -- se reinicia el conteo
            ELSE
                count <= count + '1'; -- se suma uno a la cuenta actual
            END IF;

        ELSIF (falling_edge(clk)) THEN
            IF (count = 9) THEN
                hitMax <= '1';
            ELSE
                hitMax <= '0';
            END IF;
        END IF;

    END PROCESS;

    maxCount <= hitMax;
    numberOut <= count;

END A1;