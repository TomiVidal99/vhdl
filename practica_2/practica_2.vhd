library IEEE;
use IEEE.std_logic_1164.all;

entity practica_2 is
  PORT(
    -- INPUTS
    A   : IN std_logic;
    B   : IN std_logic;
    C   : IN std_logic;
    H   : IN std_logic;
    K   : IN std_logic;
    L   : IN std_logic;
    Q   : IN std_logic;
    W   : IN std_logic;
    E   : IN std_logic;
    A2  : IN std_logic;
    B2  : IN std_logic;
    C2  : IN std_logic;
    A3  : IN std_logic;
    B3  : IN std_logic;
    C3  : IN std_logic;

    -- OUTPUTS
    T   : OUT std_logic;
    H2  : OUT std_logic;
    R   : OUT std_logic;
    O   : OUT std_logic;
    O2  : OUT std_logic
  );
end practica_2;

architecture Arq1 of practica_2 is
  signal AORB: std_logic;
  signal CORA: std_logic;
begin

EA:
  process(H, K, L) is
  begin
    T <= (H and K and L) or (K and not(L));
  end process;

EB:
  process(Q, W, E) is
  begin
    H2 <= (Q and W and E) or (not(not(Q) and W)) or (not(Q and E));
  end process;

EC:
  process(A, B, C) is
  begin
    R <= not(not(A or B) or not(not(C) or A));
  end process;

-- hago EC pero con if y whens
EC2:
  process(A3, B3, C3) is
  begin

    R <= '0';
    AORB <= A or B;
    CORA <= not(C) or A;

    if A = '1' and B = '1' then
      R <= not(AORB or CORA);
    end if;

  end process;

ED:
  process(A2, B2, C2) is
  begin
    O <= not(not(A2) or not(B2 xor C2)) or (not(A2) xor C2);
  end process;

end Arq1;
