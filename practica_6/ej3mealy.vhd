-- Ejercicio 3 de la practica 6.
-- Se aplica el modelo de Mealy para resolver.

library ieee;
use ieee.std_logic_1164.all;

entity ej3mealy is

	port
	(
		clk		 : in	std_logic;
		input	 : in	std_logic;
		reset	 : in	std_logic;
		output	 : out	std_logic;
	);

end entity;

architecture rtl of ej3mealy is

	-- Build an enumerated type for the state machine
	type state_type is (A, B, C, D);

	-- Register to hold the current state
	signal state : state_type;

begin

	process (clk, reset)
	begin

		if reset = '1' then
			state <= A;

		elsif (rising_edge(clk)) then

			-- Determine the next state synchronously, based on
			-- the current state and the input
			case state is
				when A =>
					if input = '0' then
						state <= B;
					else
						state <= C;
					end if;
				when B =>
					if input = '0' then
						state <= B;
					else
						state <= A;
					end if;
				when C =>
					if input = '0' then
						state <= A;
					else
						state <= C;
					end if;
				when D =>
					state <= A;
			end case;

		end if;
	end process;

	-- Determine the output based only on the current state
	-- and the input (do not wait for a clock edge).
	process (state, input)
	begin
			case state is
				when A =>
					output <= '0';
				when B =>
					if input = '0' then
						output <= '1';
					else
						output <= '0';
					end if;
				when C =>
					if input = '0' then
						output <= '0';
					else
						output <= '1';
					end if;
				when D =>
					output <= '0';
			end case;
	end process;

end rtl;
