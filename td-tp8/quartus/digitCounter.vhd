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
		  reset : IN std_LOGIC;
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

        IF (rising_edge(clk)) THEN
            -- sincrono con el reloj

				IF (reset = '1') THEN
					count <= (OTHERS => '0');
					hitMax <= '0';
            ELSIF (count = 9) THEN
                --count <= count + '1';
					 hitMax <= '1';
					 count <= (OTHERS => '0');
            ELSE
                --count <= (OTHERS => '0');
					 hitMax <= '0';
					 count <= count + '1';
            END IF;

        END IF;

    END PROCESS;
	 
	 maxCount <= hitMax;
    numberOUT <= count;

END A1;
