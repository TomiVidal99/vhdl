library IEEE;
use IEEE.std_logic_1164.all;

-- TODO agregar el punto decimal

entity mapeo7segments is
  PORT(
    entrada     :  IN  std_logic_vector(3 downto 0);
    habilitado  : IN std_logic;
	  decimal 	  : IN std_logic;
    salida       : OUT std_logic_vector(6 downto 0)
  );
end entity;

architecture A1 of mapeo7segments is
begin
  
  procesoPrincipal:
  process(habilitado, entrada, decimal) is
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
        when "1010" => 
			if (decimal = '0') then
				salida <= "0001000"; -- 0
			else
				salida <= "1000000"; -- 10 (A)
			end if;
        when "1011" =>
		  if (decimal = '0') then
				salida <= "0000011"; -- 1
			else
				salida <= "1111001"; -- 11 (b)
			end if;
        when "1100" =>
		  if (decimal = '0') then
				salida <= "1000110"; -- 2
			else
				salida <= "0100100"; -- 12 (C)
			end if;		  
        when "1101" => 
		  if (decimal = '0') then
				salida <= "0100001"; -- 3
			else
				salida <= "0110000"; -- 13 (d)
			end if;
        when "1110" => 
		  if (decimal = '0') then
				salida <= "0000110"; -- 4
			else
				salida <= "0011001"; -- 14 (E)
			end if;
        when "1111" =>
		  if (decimal = '0') then
				salida <= "0001110"; -- 5
			else
				salida <= "0010010"; -- 15 (F)
			end if;
        when others => salida <= "0000100"; -- Caso erroneo
      end case;
    else
      salida <= (others => '1');
    end if;
  end process;

end A1;