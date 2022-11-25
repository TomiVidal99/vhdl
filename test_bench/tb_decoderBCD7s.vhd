library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity tb_decoderBCD7s is
end entity;

architecture test of tb_decoderBCD7s is

  -- Se define el componente para el test
  component decoderBCD7s
    PORT(
          input  : IN  INTEGER RANGE 0 TO 9;
          output : OUT BIT_VECTOR(6 DOWNTO 0)
        );
  end component;

  signal input  : INTEGER RANGE 0 TO 9;
  signal output : BIT_VECTOR(6 DOWNTO 0);
 
begin

  -- esto me conecta las señales con las entradas y salidas del componente
  uut: decoderBCD7s port map (input => input, output => output);

  estimulos: 
    process
    begin

      wait for 500 ns;
        for i in 0 to 15 loop
          input <= i;
          wait for 500 ns;
        end loop;
        wait for 50 us;

  end process estimulos;


end test;
