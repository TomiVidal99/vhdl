-- Primer Programa en VHDL
-- Hecho a partir de la clase de TÃƒÆ’Ã‚Â©cnicas Digitales
-- Por: Tomas Vidal

-- SE INCLUYEN LIBRERIAS (las siguientes dos lineas siempre hay que incluirlas)
library IEEE; -- get std_logic from here
use IEEE.std_logic_1164.all; -- get the std_logic and all the sub packages

-- ENTIDAD
entity Program1 is
	port
	(
		-- Input ports
		CLK   : in  std_logic;
    RST   : in  std_logic;
    SET   : in  std_logic;
		A     : in  std_logic;
		B     : in  std_logic;
		C     : in  std_logic;
		D     : in  std_logic_vector(1 downto 0); -- mas de un bit (es como un bus de datos). Para asignar creciente se puede usar "to" y para decreciente se puede usar "downto"
		--D : in  std_logic_vector(0 to 1);

		-- Output ports
		F: out std_logic -- en ultimo no lleva ;
	);
end Program1;


-- ARQUITECTURA
-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture Arq1 of Program1 is

	-- Declarations (optional)
  -- que recursos se van a usar en esta arquitectura

  -- Las seÃ±ales me sivern cuando quiero usar una variable como entrada y salida, ej: recursividad: F <= A + F
  signal N : std_logic;

begin

  -- empieza la implementacion

  --F <= (A and B) or C; -- or, nor, and, nand, xor, xnor, not (COMO EN PUERTAS)

  -- Las expresiones logicas integran multiplexores: ej: when, else
  --F <= (A and B) or C when B = '1' else A;

  --F <= (A and B) or C when D = "01" else B when D = "10" else A;

  --F <= (A and B) or C when D = "01" else B when D = "10";

  -- Yo quiero escribir F <= A + F (entonces uso N como seÃ±al intermedia)
  --N <= A and N;

  -- FLIP FLOPS (solo se puede usar tipo D). (se usa la palabra clave: rising_edge)
  --F <= B and N when rising_edge(CLK); -- Flanco ascendente
  --F <= '0' when RST = '1' else '1' when SET = '1' else B and N when falling_edge(CLK); -- Flanco descendente
  
P1:
  -- Los procesos no se compilan simultaneamente, se ejecutan secuencialmente.
  -- Se pueden redefinir variables y se tomara al ultima
	process(A, B, C) is
		-- Declaration(s)
	begin
		-- Sequential Statement(s)
    F <= (A and B) or C;

    -- Como esto de aca es secuencial no se puede implementar un when aqui adentro, el siguiente codigo daria ERROR:
    -- F <= (A and B) or C when A = '1' else '0'

    -- Para poder ejecutar la siguiente sentencia dentro de un proceso:
    -- F <= (A and B) or C when B = '1' else A;
    if D = "10" then
      F <= (A and B) or C;
    elsif D = "01" then
      F <= B;
    else
      F <= A;
    end if;

	end process;


end Arq1;
