library IEEE;
use IEEE.std_logic_1164.all;

entity ej2 is
  PORT(
    BUTTON  : IN    std_logic_vector(2 downto 0);
    SW      : IN    std_logic_vector(9 downto 0);
    LEDG    : OUT   std_logic_vector(9 downto 0)
  );
end entity;

architecture A1 of ej2 is
begin

  
  -- incisio 1
  --process(BUTTON, SW) is
  --begin
  --
  --  LEDG(9 downto 0) <= (others => '0');
  --  if (SW(4) = '1' AND BUTTON(2) = '0') then
  --    LEDG(1 downto 0) <= "00";
  --  end if;
  --
  --end process;


  
  -- inciso 2
  process(BUTTON, SW) is
  begin
  
    LEDG(9 downto 0) <= (others => '0');
    if (SW(0) = '1') then
      if (SW(1) = '0') then
        LEDG(1 downto 0) <= "11";
      else
        LEDG(3 downto 2) <= "11";
      end if;
    else
      if (BUTTON(2) = '0') then
        LEDG(1) <= '1';
        LEDG(2) <= '1';
        LEDG(5) <= '1';
      end if;
    end if;
  
  end process;

end A1;
