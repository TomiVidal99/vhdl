library ieee;
use ieee.std_logic_1164.all;

entity Program2 is
  Port(
    -- INPUTS
    A   : in  std_logic;
    B   : in  std_logic;
    C   : in  std_logic;

    -- OUTPUS
    X   : out  std_logic;
    Y   : out  std_logic;
    Z   : out  std_logic
  );
end Program2;

architecture Arq1 of Program2 is
begin

  -- Defino X
Proceso1:
  process(A, B) is
  begin

    X <= '0';

    if A = '1' and B = '1' then
      X <= '1';
    end if;

  end process;

  -- Defino Y
Proceso2:
  process(C) is
  begin

    Y <= '1';

    if C = '1' then
      Y <= '0';
    end if;

  end process;

end Arq1;
