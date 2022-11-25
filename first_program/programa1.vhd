-- Primer Programa en VHDL
-- Hecho a partir de la clase de TÃƒÂ©cnicas Digitales
-- Por: Tomas Vidal

-- SE INCLUYEN LIBRERIAS (las siguientes dos lineas siempre hay que incluirlas)
library IEEE; -- get std_logic from here
use IEEE.std_logic_1164.all; -- get the std_logic and all the sub packages

-- ENTIDAD
entity Programa1 is
	port
	(
		-- Input ports
		A : in  std_logic;
		B : in  std_logic;
		C : in  std_logic;

		-- Output ports
		F: out std_logic -- en ultimo no lleva ;
	);
end Programa1;


-- ARQUITECTURA
-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture Arq1 of Programa1 is

	-- Declarations (optional)
  -- que recursos se van a usar en esta arquitectura

begin

  -- empieza la implementacion

  --F <= (A and B) or C; -- or, nor, and, nand, xor, xnor, not (COMO EN PUERTAS)

end Arq1;
