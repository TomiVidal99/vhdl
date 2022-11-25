library IEEE;
use IEEE.std_logic_1164.all;

entity primera_funcion is
PORT(
  V, Y, S, Q  : IN  std_logic;
  H, H2     : OUT std_logic
);
end entity;

architecture A1 of primera_funcion is
begin

  -- Hago las dos (H y HOPT) porque asi puedo corroborar que la optimizacion 
  -- no modifica el resultado, lo que me dice que hice bien las cuentas.

  -- H sin modificar
  H <= (not(V) and not(Y) and not(S) and Q) OR
       (not(S) and Y and not(V) and not(Q)) OR
       (not(S or Q) and (V xor Y)) OR
       ( not(V) and ((S and Q and not(Y)) or (Q and not(Y) and not(S)) ) ) OR
       (not( not(V) or not(S) ));

  -- H optimizada con alegra de bool y mapa de karnaugh
  H2 <=  '1'
        WHEN
            (V = '1' AND S = '1'                        ) OR
            (V = '0' AND Y = '0' AND             Q = '1') OR
            (V = '0' AND Y = '1' AND S = '0' AND Q = '0') OR
            (V = '1' AND Y = '0' AND S = '0' AND Q = '0')
        ELSE 
        '0';

end A1;
