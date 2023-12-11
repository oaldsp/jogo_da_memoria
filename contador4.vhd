library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
 
entity contador4 is
	port(
	RSTN , clk : in std_logic;
	Q : out std_logic_vector (1 downto 0)
	);
end contador4;

architecture contador4_arch of contador4 is
--COMPONENT--
	component jkff is
		port (
		clk , J , K , PRN ,CLRN : in std_logic;
		Q : out std_logic
		);
	end component;
--COMPONENT--END--

--SIGNAL--
	signal Q_s , J_s , K_s , PRN_s , CLRN_s: std_logic_vector (1 downto 0);
	signal clk_s  , rstn_s : std_logic;
--SIGNAL--END--

--BEGIN--
	begin
	gen00: for i in 0 to 1 generate
	ffi0: jkff port map (
		clk=>clk_s , J=>J_s(i) , K=>K_s(i) , PRN=>PRN_s(i) , CLRN=>CLRN_s(i) ,
		Q=>Q_s(i)
		);
		PRN_s(i) <= '1';  
		CLRN_s(i) <= rstn_s;
		
	end generate;
	
	K_s(0)<= '1';
	J_s(0)<= '1';
	K_s(1)<=Q_s(0);
	J_s(1)<=Q_s(0);
		
	clk_s	<= clk;
	rstn_s<=RSTN;
	Q<=Q_s;
end contador4_arch;