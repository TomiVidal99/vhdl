LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ej5 IS
  PORT(
    ctrlS   : IN  STD_LOGIC_VECTOR(2 downto 0);
    ctrlD   : IN  STD_LOGIC;
    dataIn  : IN  STD_LOGIC_VECTOR(7 downto 0);
    dataOut : OUT STD_LOGIC_VECTOR(7 downto 0)
  );
END ej5;

ARCHITECTURE Arq OF ej5 IS
  signal dataOutL : STD_LOGIC_VECTOR(7 downto 0);
  signal dataOutR : STD_LOGIC_VECTOR(7 downto 0);
BEGIN

  dataOutL <= dataIn(7 downto 1) & '0'      when (ctrlD = '1' and ctrlS = "001")  else
              dataIn(7 downto 2) & "00"     when (ctrlD = '1' and ctrlS = "010")  else
              dataIn(7 downto 3) & "000"    when (ctrlD = '1' and ctrlS = "011")  else
              dataIn                        when (ctrlD = '1' and ctrlS = "000")  else
              X"00"                         when (ctrlD = '1' and ctrlS(2) = '1') else
              (others => '0');

  with ctrlD & ctrlS select
    dataOutR <= '0'   & dataIn(7 downto 1)  when '0' & "001",
                "00"  & dataIn(7 downto 2)  when '0' & "010",
                "000" & dataIn(7 downto 3)  when "0011",
                "00000000"                  when "0100" | "0101" | "0110" | "0111",
                (others => '0')             when others;

-- implementacion con process (hay que ver si se puede hacer alguna optimizacion)
--PRO: 
--  PROCESS(ctrlD, ctrlS) IS
--  BEGIN
--
--    if ctrlD = '1' then
--      if ctrlS = "000" then
--        dataOutL <= dataIn;
--      elsif ctrlS = "001" then
--        dataOutL <= dataIn(7 downto 1) & '0';
--      elsif ctrlS = "010" then
--        dataOutL <= dataIn(7 downto 2) & "00";
--      elsif ctrlS = "011" then
--        dataOutL <= dataIn(7 downto 3) & "000";
--      elsif ctrlS(2) = '1' then
--        dataOutL <= dataIn(7 downto 3) & "000";
--      else
--        dataOutL <= "00000000";
--      end if;
--    end if;
--
--  END PROCESS;

  dataOut <= dataOutL when ctrlD = '1' else dataOutR;

END Arq;
