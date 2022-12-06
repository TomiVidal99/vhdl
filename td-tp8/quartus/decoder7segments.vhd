LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- Es un decodificador de un display de 7 segmentos (sin punto DECIMAL)
-- se espera una entrada (number de 4 bits) que representa un DECIMAL de 0 a 15;
-- la señal de 'ENABLE' solamente apaga o prende el display (en su totalidad).
-- Los LEDs individuales de los displays se consideran activos a baja. (como dice
-- en el manual de usuario de la FPGA).

ENTITY decoder7segments IS
  PORT (
    NUMBER : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    ENABLE : IN STD_LOGIC;
    OUTPUT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE A1 OF decoder7segments IS
BEGIN

  bcd7segmentsMapping :
  PROCESS (ENABLE, NUMBER) IS
  BEGIN
    IF (ENABLE = '1') THEN
      CASE NUMBER IS
        WHEN "0000" => OUTPUT <= "1000000"; -- 0
        WHEN "0001" => OUTPUT <= "1111001"; -- 1
        WHEN "0010" => OUTPUT <= "0100100"; -- 2
        WHEN "0011" => OUTPUT <= "0110000"; -- 3
        WHEN "0100" => OUTPUT <= "0011001"; -- 4
        WHEN "0101" => OUTPUT <= "0010010"; -- 5
        WHEN "0110" => OUTPUT <= "0000010"; -- 6
        WHEN "0111" => OUTPUT <= "1111000"; -- 7
        WHEN "1000" => OUTPUT <= "0000000"; -- 8
        WHEN "1001" => OUTPUT <= "0011000"; -- 9
        WHEN "1010" => OUTPUT <= "1000000"; -- 0
        WHEN "1011" => OUTPUT <= "1111001"; -- 1
        WHEN "1100" => OUTPUT <= "0100100"; -- 2
        WHEN "1101" => OUTPUT <= "0110000"; -- 3
        WHEN "1110" => OUTPUT <= "0011001"; -- 4
        WHEN "1111" => OUTPUT <= "0010010"; -- 5
        WHEN OTHERS => OUTPUT <= "0000100"; -- Caso erroneo
      END CASE;
    ELSE
      OUTPUT <= (OTHERS => '1');
    END IF;
  END PROCESS;

END A1;
