LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

-- Es un decodificador de un display de 7 segmentos (sin punto DECIMAL)
-- se espera una entrada (number) que representa un DECIMAL de 0 a 15;
-- con el cual la OUTPUT representa un DECIMAL (si 'DECIMAL' está activo, en alto),
-- caso contrario representa un hexadecimal en el display
-- la señal de 'ENABLE' solamente apaga o prende el display.

ENTITY decoder7segments IS
  PORT (
    NUMBER : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    ENABLE : IN STD_LOGIC;
    DECIMAL : IN STD_LOGIC;
    OUTPUT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE A1 OF decoder7segments IS
BEGIN

  bcd7segmentsMapping :
  PROCESS (ENABLE, NUMBER, DECIMAL) IS
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
        WHEN "1010" =>
          IF (DECIMAL = '0') THEN
            OUTPUT <= "0001000"; -- 10 (A)
          ELSE
            OUTPUT <= "1000000"; -- 0
          END IF;
        WHEN "1011" =>
          IF (DECIMAL = '0') THEN
            OUTPUT <= "0000011"; -- 11 (b)
          ELSE
            OUTPUT <= "1111001"; -- 1
          END IF;
        WHEN "1100" =>
          IF (DECIMAL = '0') THEN
            OUTPUT <= "1000110"; -- 12 (C)
          ELSE
            OUTPUT <= "0100100"; -- 2
          END IF;
        WHEN "1101" =>
          IF (DECIMAL = '0') THEN
            OUTPUT <= "0100001"; -- 13 (d)
          ELSE
            OUTPUT <= "0110000"; -- 3
          END IF;
        WHEN "1110" =>
          IF (DECIMAL = '0') THEN
            OUTPUT <= "0000110"; -- 14 (E)
          ELSE
            OUTPUT <= "0011001"; -- 4
          END IF;
        WHEN "1111" =>
          IF (DECIMAL = '0') THEN
            OUTPUT <= "0001110"; -- 15 (F)
          ELSE
            OUTPUT <= "0010010"; -- 5
          END IF;
        WHEN OTHERS => OUTPUT <= "0000100"; -- Caso erroneo
      END CASE;
    ELSE
      OUTPUT <= (OTHERS => '1');
    END IF;
  END PROCESS;

END A1;