-- Practica 3 de Tecnicas Digitales
-- Por: Tomas Vidal

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY practica3 IS
  PORT(
    -- INPUTS
    B   : IN STD_LOGIC;
    A   : IN STD_LOGIC;
    C   : IN STD_LOGIC;
    D   : IN STD_LOGIC;

    -- OUTPUTS
    T   : OUT STD_LOGIC;
    Z   : OUT STD_LOGIC
  );
END practica3;

ARCHITECTURE Arq1 OF practica3 IS
  SIGNAL MUX1OUT: STD_LOGIC;
  SIGNAL MUX1IN : STD_LOGIC;
BEGIN

  --T <= ((A xnor B) and (not(C) xor D)) when D = '0' else '1';

--P1:
--  PROCESS(D) IS
--  BEGIN
--
--    T <= '1';
--
--    if D = '0' then
--      T <= ((A xnor B) and (not(C) xor D));
--    end if;
--
--  END PROCESS;

P2:
  PROCESS(A, B, C, D) IS
  BEGIN

    -- Condicion de salida del primer mux
    MUX1IN <= (A nand B) nor (B nor not(D));

    -- Salida del primer mux
    if MUX1IN = '0' then
      MUX1OUT <= (A nand B);
    else
      MUX1OUT <= C;
    end if;

    if A = '0' then
      Z <= MUX1OUT;
    else
      Z <= MUX1IN;
    end if;

    T <= MUX1IN;

  END PROCESS;

END Arq1;
