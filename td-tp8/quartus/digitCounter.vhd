LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_signed.ALL;
USE IEEE.numeric_std.ALL;

-- Este componente permite contar y volver a principio
-- cuando se llega al limite 'MAX_COUNT'

ENTITY digitCounter IS
    GENERIC (
        MAX_COUNT : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0')
    );
    PORT (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        maxCount : OUT STD_LOGIC;
        numberOUT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
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

        ELSIF (rising_edge(clk)) THEN
            -- sincrono con el reloj
            count <= count + '1'; -- se suma uno a la cuenta actual

            -- señal que indica si se llego al maximo numero de la cuenta
            IF (count = 9) THEN
                hitMax <= '1';
                count <= (OTHERS => '0'); -- se reinicia el conteo
            ELSE
                hitMax <= '0';
            END IF;

        END IF;

    END PROCESS;

    maxCount <= hitMax;
    numberOUT <= count;

END A1;