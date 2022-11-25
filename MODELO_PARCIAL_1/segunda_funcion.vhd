library IEEE;
use IEEE.std_logic_1164.all;

entity segunda_funcion is
PORT(
  V, Y, Q, S    : IN  std_logic;
  K, K2         : OUT std_logic
);
end entity;

architecture A1 of segunda_funcion is
begin

  -- Defino K sin optimizar
  K <=  (Q and not( not( not(S) and V ) and not( not(S) and not(V) ) )) OR
        (S and not( not( not(Y) and V ) and not(V and Y) ));

  -- Defino K despues de la optimizacion por algebra de bool y mapa de karnaugh
  K2 <= (V and S) OR
        (Q and not(S));

end A1;
