Library ieee; 
use ieee.std_logic_1164.all; 


ENTITY comparador IS
   PORT( 
		mem   : IN  STD_LOGIC_VECTOR(7 downto 0);
		entrada   : IN  STD_LOGIC_VECTOR(7 downto 0);
      clk : IN	STD_LOGIC;
		errou      : OUT   STD_LOGIC;
		acertou      : OUT   STD_LOGIC
	);
END comparador;


ARCHITECTURE funcionamento OF comparador IS 

BEGIN
	PROCESS(mem, entrada) IS
	BEGIN
		IF (clk = '0') THEN
				IF (entrada = mem) THEN
					acertou <= '1';
				ELSE
					errou <= '0';
				END IF;
		ELSE
			acertou <= '0';
			errou <= '1';
		END IF;
	END PROCESS;

END ARCHITECTURE;