-- Ejercicio 3 de la practica 6
-- Aplico el model Moore al circuito.

library ieee;
use ieee.std_logic_1164.all;

entity ej3moore is

	port(
		clk		    : in	std_logic;
		input	    : in	std_logic;
		reset	    : in	std_logic;
		output	  : out std_logic
	);

end entity;

architecture rtl of ej3moore is

	-- Build an enumerated type for the state machine
	type state_type is (A, B, C, D);

	-- Register to hold the current state
	signal state   : state_type;

begin

	-- Logic to advance to the next state
	process (clk, reset)
	begin
		if reset = '1' then
			state <= A;
		elsif (rising_edge(clk)) then
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
						state <= C;
					end if;
				when C =>
					if input = '0' then
						state <= A;
					else
						state <= D;
					end if;
				when D =>
					if input = '0' then
						state <= A;
					else
						state <= D;
					end if;
			end case;
		end if;
	end process;

	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when A =>
				output <= '0';
			when B =>
				output <= '1';
			when C =>
				output <= '0';
			when D =>
				output <= '1';
		end case;
	end process;

end rtl;
