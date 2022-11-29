library IEEE;
use IEEE.std_logic_1164.all;

-- TODO agregar el punto decimal

entity mapeo7segments is
  PORT(
    entrada    : IN  std_logic_vector(3 downto 0);
    habilitado : IN std_logic;
    salida     : OUT std_logic_vector(6 downto 0)
  );
end entity;

architecture A1 of mapeo7segments is
begin

  
  procesoPrincipal:
  process(entrada) is
  begin
    if (habilitado = '1') then
      case entrada is
        when "0000" => salida <= "1000000"; -- 0
        when "0001" => salida <= "1111001"; -- 1
        when "0010" => salida <= "0100100"; -- 2
        when "0011" => salida <= "0110000"; -- 3
        when "0100" => salida <= "0011001"; -- 4
        when "0101" => salida <= "0010010"; -- 5
        when "0110" => salida <= "0000010"; -- 6
        when "0111" => salida <= "1111000"; -- 7
        when "1000" => salida <= "0000000"; -- 8
        when "1001" => salida <= "0011000"; -- 9
        when "1010" => salida <= "0001000"; -- 10 (A)
        when "1011" => salida <= "0000011"; -- 11 (b)
        when "1100" => salida <= "1000110"; -- 12 (C)
        when "1101" => salida <= "0100001"; -- 13 (d)
        when "1110" => salida <= "0000110"; -- 14 (E)
        when "1111" => salida <= "0001110"; -- 15 (F)
        when others => salida <= "0000100"; -- Caso erroneo
      end case;
    else
      salida <= (others => '1');
    end if;
  end process;

end A1;
