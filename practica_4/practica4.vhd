-- Practica 4 Tecnicas Digitales
-- Por: Tomas Vidal

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY practica4 IS
  PORT(
    ctrl      : IN  STD_LOGIC_VECTOR(0 to 1);
    rst       : IN  STD_LOGIC;
    dataInA   : IN  STD_LOGIC;
    dataInB   : IN  STD_LOGIC;
    dataOut   : OUT STD_LOGIC
  );
END practica4;

ARCHITECTURE Arq1 OF practica4 is
BEGIN

  P1: PROCESS(ctrl, rst, dataInA, dataInB) IS
  BEGIN

    if rst = '1' then
      dataOut <= '1';
    elsif ctrl(1) = '1' or ctrl(0) = '0' then
      dataOut <= dataInB;
    elsif (ctrl(1) xor ctrl(0)) = '1' then
      dataOut <= dataInA;
    else
      dataOut <= '0';
    end if;

  END PROCESS;

END Arq1;
