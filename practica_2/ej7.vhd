library IEEE;
use IEEE.std_logic_1164.all;

entity ej7 is
  port(
    i_clk       : IN  std_logic;
--    dataIn      : IN  std_logic_vector(3 downto 0);
--    secDataIn   : IN  std_logic_vector(3 downto 0);
--    ifDataIn    : IN  std_logic_vector(3 downto 0);
    invDataIn   : IN  std_logic_vector(3 downto 0);

--    dataOut     : OUT std_logic_vector(6 downto 0);
--    secDataOut  : OUT std_logic_vector(6 downto 0);
--    ifDataOut   : OUT std_logic_vector(6 downto 0);
    invDataOut  : OUT std_logic_vector(6 downto 0)
  );
end ej7;

architecture arq of ej7 is
  signal invertedDataIn : std_logic_vector(3 downto 0);
begin

--  dataOut <=  "1111110" when dataIn = "0000" else
--              "0110000" when dataIn = "0001" else
--              "0110111" when dataIn = "0010" else
--              "1111001" when dataIn = "0011" else
--              "0110011" when dataIn = "0100" else
--              "1011011" when dataIn = "0101" else
--              "1011111" when dataIn = "0110" else
--              "1110000" when dataIn = "0111" else
--              "1111111" when dataIn = "1000" else
--              "1111011" when dataIn = "1001" else
--              "0001000"; -- solo hago una raya cuando me toca un don't care
--
---- Implementacion con un process secuencial
--codiSecuencial:
--process(secDataIn) is
--begin
--
--  case secDataIn is
--    when "0000" => secDataOut <= "1111110";
--    when "0001" => secDataOut <= "0110000"; 
--    when "0010" => secDataOut <= "0110111"; 
--    when "0011" => secDataOut <= "1111001"; 
--    when "0100" => secDataOut <= "0110011"; 
--    when "0101" => secDataOut <= "1011011"; 
--    when "0110" => secDataOut <= "1011111"; 
--    when "0111" => secDataOut <= "1110000"; 
--    when "1000" => secDataOut <= "1111111"; 
--    when "1001" => secDataOut <= "1111011"; 
--    when others => secDataOut <= "0001000"; -- solo hago una raya cuando me toca un don't care
--  end case;
--
--end process;
--
--codiSecuencialConIf:
--process(ifDataIn) is
--begin
--
--  if    ifDataIn = "0000" then ifDataOut <= "1111110";
--  elsif ifDataIn = "0001" then ifDataOut <= "0110000"; 
--  elsif ifDataIn = "0010" then ifDataOut <= "0110111"; 
--  elsif ifDataIn = "0011" then ifDataOut <= "1111001"; 
--  elsif ifDataIn = "0100" then ifDataOut <= "0110011"; 
--  elsif ifDataIn = "0101" then ifDataOut <= "1011011"; 
--  elsif ifDataIn = "0110" then ifDataOut <= "1011111"; 
--  elsif ifDataIn = "0111" then ifDataOut <= "1110000"; 
--  elsif ifDataIn = "1000" then ifDataOut <= "1111111"; 
--  elsif ifDataIn = "1001" then ifDataOut <= "1111011"; 
--  else  ifDataOut <= "0001000"; -- solo hago una raya cuando me toca un don't care
--  end if;
--
--end process;

inciso4:
process(invDataIn, invertedDataIn) is
begin

  -- TODO: Como se podria hacer lo mismo que lo anterior
  -- pero con las puertas negadas?
  -- podria hacer una señal intermedia que sea la entrada invertida?
  --invertedDataIn <= not(invDataIn(6 downto 0));
  report "Inciso 4";

  -- Implementacion con un reloj
  if risigin_edge(i_clk) then

    -- invierto la señal de entrada que estaba negada, asi quedandome con la señal original
    for index in 3 downto 0 loop
      invertedDataIn(index) <= not(invDataIn(index));
    end loop;

    if    invertedDataIn = "0000" then invDataOut <= "1111110";
    elsif invertedDataIn = "0001" then invDataOut <= "0110000"; 
    elsif invertedDataIn = "0010" then invDataOut <= "0110111"; 
    elsif invertedDataIn = "0011" then invDataOut <= "1111001"; 
    elsif invertedDataIn = "0100" then invDataOut <= "0110011"; 
    elsif invertedDataIn = "0101" then invDataOut <= "1011011"; 
    elsif invertedDataIn = "0110" then invDataOut <= "1011111"; 
    elsif invertedDataIn = "0111" then invDataOut <= "1110000"; 
    elsif invertedDataIn = "1000" then invDataOut <= "1111111"; 
    elsif invertedDataIn = "1001" then invDataOut <= "1111011"; 
    else  invDataOut <= "0001000"; -- solo hago una raya cuando me toca un don't care
    end if;

  end if;


end process;

end arq;
