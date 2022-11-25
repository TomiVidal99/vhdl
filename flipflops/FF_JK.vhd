-- Implementacion de un flip flop tipo JK

library ieee;
use ieee.std_logic_1164.all;

entity FF_JK is
	port
	(
		-- In Control
		CLK		: IN std_logic;
		RSTn		: IN std_logic;
		SETn		: IN std_logic;
		ENA		: IN std_logic;
		
		-- In Data
		J			: IN std_logic;
		K			: IN std_logic;
		
		-- Out Data
		Q			: OUT std_logic
);
end FF_JK;


architecture Arq of FF_JK is

signal	QAux	: std_logic;
signal	D		: std_logic;

begin


-- Forma concurrente
-- D			<= not K when QAux = '1' else J;
-- QAux		<= '0' when RSTn = '0' else '1' when SETn = '0' else D when rising_edge(CLK) and ENA = '1';
-- Q 		<= QAux;



-- Usando Process
pr0: process(CLK,RSTn,SETn,ENA,J,K,QAux) is
begin

	if RSTn = '0' then
		QAux 	<= '0';
	elsif SETn = '0' then
		QAux 	<= '1';
	elsif rising_edge(CLK) and ENA = '1' then
	-- Con compuertas 
	--	QAux	<=  (J and (not QAux)) or ((not K) and QAux);
	
	-- Con MUX
		if QAux = '1' then
			QAux	<= not K;
		else
			QAux	<= J;
		end if;
		
	end if;

end process;

Q <= QAux;

end Arq;
