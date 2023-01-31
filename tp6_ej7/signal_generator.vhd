-- se resuelve el ejercicio 7 de la práctica 6 de Técnicas Digitales
-- El ejercicio consiste en la implementacion de un generador de onda
-- cuadrada con ciclo de trabajo variable, los ciclos son 4 y se eligen
-- mediante la señal de entrada ctrl.

library IEEE;
use IEEE.std_logic_1164.all;

entity signal_generator is
  PORT(
    clk, reset  : IN  std_logic;
    ctrl        : IN  std_logic_vector(1 downto 0);
    output      : OUT std_logic
  );
end entity;

architecture rtl of signal_generator is

	-- Build an enumerated type for the state machine
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);

	-- Register to hold the current state
	signal state  : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset, ctrl)
	begin
		if reset = '1' then
			state <= s0;
		elsif (rising_edge(clk)) then
			case state is
				when s0=>
					state <= s1;
				when s1=>
					state <= s2;
				when s2=>
					state <= s3;
				when s3 =>
					state <= s4;
				when s4 =>
					if ctrl = "00" then
						state <= s0;
					else
						state <= s5;
					end if;
				when s5 =>
					if ctrl = "01" then
						state <= s0;
					else
						state <= s6;
					end if;
				when s6 =>
					if ctrl = "10" then
						state <= s0;
					else
						state <= s7;
					end if;
				when s7 =>
					state <= s0;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s1 =>
				output <= '1';
			when s2 =>
				output <= '1';
      when others => output <= '0';
		end case;
	end process;

end rtl;
