library ieee;
use ieee.std_logic_1164.all;

entity SerialAdder is
	generic(
		N :integer := 4
	);
	port(
		DATO_A 	:in std_logic_vector(N-1 downto 0);
		DATO_B 	:in std_logic_vector(N-1 downto 0);
		CLK		:in std_logic;
		HAB		:in std_logic;
		DATO_S	:out std_logic_vector(N-1 downto 0);
		Ready		:out std_logic
);
end SerialAdder;

architecture Arq of SerialAdder is

component FA is
	port
	(
		D1 : in std_logic;
		D2 : in std_logic;
		Ci : in std_logic;
		
		Co : out std_logic;
		So : out std_logic
);
end component;


signal RegA :std_logic_vector(N-1 downto 0);
signal RegB :std_logic_vector(N-1 downto 0);
signal RegS :std_logic_vector(N-1 downto 0);

signal RegReady :std_logic_vector(N-1 downto 0);

signal Ci_Delay 	:std_logic;
signal Co 			:std_logic;
signal So 			:std_logic;
begin

process(CLK,HAB,DATO_A,DATO_B) is
begin

	if HAB='1' then
		RegA		<= DATO_A;
		RegB		<= DATO_B;
		RegS		<= (others=>'0');
		RegReady <= (others=>'0');
	elsif rising_edge(CLK) then
		RegA(N-1 downto 0) <= '0' & RegA(N-1 downto 1);
		RegB(N-1 downto 0) <= '0' & RegB(N-1 downto 1);
		RegS(N-1 downto 0) <= So & RegS(N-1 downto 1);
		
		RegReady(N-1 downto 0) <= '1' & RegReady(N-1 downto 1);
	end if;

end process;

FA_0: FA port map (D1=> RegA(0), D2=>RegB(0), Ci=>Ci_Delay, Co=>Co, So=>So);


Ci_Delay <= '0' when HAB='1' else Co when rising_edge(CLK);

DATO_S	<= RegS;

Ready <= RegReady(0);

end Arq;
