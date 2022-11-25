-- Se implementa un barrel shifter de "BARREL_LENGTH" bits

library IEEE;
use IEEE.std_logic_1164.ALL;

entity ej8 is
  -- DEFINO ALGUNAS CONSTANTES
  generic (
    constant BARREL_LENGTH : INTEGER := 4
  );
  port (
    i_data        : IN  std_logic_vector(BARREL_LENGTH downto 0);
    i_direction   : IN  std_logic; -- direccion en que se desea hacer el shift (derecha = 1)
    -- TODO: pensar como hacer esto variable con BARREL_LENGTH
    i_amount      : IN  std_logic_vector(1 downto 0); -- cantidad de bits que se shiftean
    o_data        : OUT std_logic_vector(BARREL_LENGTH downto 0)
  );
end ej8;

architecture arq of ej8 is
begin

  -- Implementacion concurrente del barrel shifter
  o_data <= i_data

end arq;
