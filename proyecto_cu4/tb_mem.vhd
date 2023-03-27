-- Test bench para la memoria de 1 puerto 8 bits y 4096 palabras.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_UNSIGNED.all;

entity tb_mem is
end entity;

architecture A1 of tb_mem is

  constant ADDRESS_WIDTH: integer := 12;
  constant DATA_WIDTH: integer := 16;

  component mem is
	PORT(
		address : IN STD_LOGIC_VECTOR (ADDRESS_WIDTH-1 DOWNTO 0);
		clock   : IN STD_LOGIC := '1';
		data    : IN STD_LOGIC_VECTOR (DATA_WIDTH-1 DOWNTO 0);
		wren    : IN STD_LOGIC;
		q       : OUT STD_LOGIC_VECTOR (DATA_WIDTH-1 DOWNTO 0)
	);
  end component;

  signal data_in, data_out: STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
  signal address: STD_LOGIC_VECTOR(ADDRESS_WIDTH-1 downto 0);
  signal clk, we: STD_LOGIC;

begin

  uut: mem port map (
    clock => clk,
    data => data_in,
    address => address,
    wren => we,
    q => data_out
  );

  gen_reloj: process
  begin
    clk <= '0';
    wait for 10 ns;
    clk <= '1';
    wait for 10 ns;
  end process gen_reloj;

  estimulos: process
  begin

    address <= X"000"; -- 12 bits
    data_in <= X"0000"; -- 16 bits
    we      <= '0';
    wait for 20 ns; -- espera 1 ciclo de reloj

    for i in 0 to 9 loop
      address <= CONV_STD_LOGIC_VECTOR(i, 12);
      wait for 20 ns;
    end loop;

    we <= '1';
    address <= "000000000000";
    for i in 0 to 9 loop
      address <= CONV_STD_LOGIC_VECTOR(i, 12);
      data_in <= CONV_STD_LOGIC_VECTOR(i, 16);
      wait for 20 ns;
    end loop;

    we <= '0';
    address <= "000000000000";

    for i in 0 to 19 loop
      address <= CONV_STD_LOGIC_VECTOR(i, 12);
      wait for 20 ns;
    end loop;

    wait for 100 ns;

  end process estimulos;

end A1;

