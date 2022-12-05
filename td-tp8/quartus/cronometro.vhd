library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_signed.all;

-- BUTTON0 = START
-- BUTTON1 = RESET
-- SW(0)   = PAUSE

entity cronometro is
  PORT(
    CLOCK_50  : IN  std_logic;
    SW        : IN  std_logic_vector(9 downto 0);
    BUTTON0   : IN  std_logic;
    BUTTON1   : IN  std_logic;
    HEX0      : OUT std_logic_vector(6 downto 0);
    HEX1      : OUT std_logic_vector(6 downto 0);
    HEX2      : OUT std_logic_vector(6 downto 0);
    HEX3      : OUT std_logic_vector(6 downto 0);
    HEX2_DP   : OUT std_logic
  );
end entity;

architecture A1 of cronometro is

  component mapeo7segments is
    port (
      entrada     :  IN  std_logic_vector(3 downto 0);
      habilitado  : IN std_logic;
      decimal 	  : IN std_logic;
      salida       : OUT std_logic_vector(6 downto 0)
    );
  end component;

component divisor_de_frecuencia is
    generic (
      MAX_COUNT: integer := 250000
    );
    port (
      CLOCK     :       IN  std_logic;
      RESET     :       IN std_logic;
      SALIDA    :       OUT std_logic
    );
  end component;


  signal cronometro   : std_logic_vector(13 downto 0);
  signal unidad       : std_logic_vector(13 downto 0);
  signal decenas      : std_logic_vector(13 downto 0);
  signal centenas     : std_logic_vector(13 downto 0);
  signal unidadDeMil  : std_logic_vector(13 downto 0);
  signal clk          : std_logic; -- señal de 0,01s = 100hz
  signal contando     : std_logic;
begin

  
  

  

  
  -- RESETEO
  process(BUTTON1,cronometro,contando) is
  begin
  
    if(BUTTON1 = '1') then
      cronometro <= (others => '0');
      contando <= '0';
    end if;
  end process;

  --START
  process (clk, BUTTON0, contando)
  begin
    
    if (rising_edge(clk) and BUTTON0 = '1') then
      contando <= '1';
      cronometro <= (others =>'0');
    end if;

  end process;


  -- Se suma 0,01 segundos a la cuenta hasta llegar a 99s
  process (clk,contando,cronometro,SW(0))
  begin
    
    if (rising_edge(clk) and SW(0) = '0' and contando = '1' and cronometro < "10011100001111") then
      cronometro <= cronometro + '1';
    end if;

  end process;

  --unidad <= cronometro - "1010";
  --decenas <= cronometro mod 100;
  --centenas <= cronometro mod 1000;
  --unidadDeMil <= cronometro mod 10000;

  d7s_0: mapeo7segments port map (
    entrada => unidad(3 downto 0),
      habilitado => '1',
      decimal => '1',
      salida => HEX0
  );

clk100: divisor_de_frecuencia port map (
    CLOCK => CLOCK_50,
    RESET => BUTTON1,
    SALIDA => clk
  );

end A1;
