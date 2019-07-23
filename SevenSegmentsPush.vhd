-- Baseado no código de FPGA Prototyping by VHDL Examples - Pong P. Chu
-- Adaptacao para a placa DE1 da Altera
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SevenSegmentsPush is
   port(
      --dp: in std_logic;
      HEX0: out std_logic_vector(6 downto 0);
		HEX1: out std_logic_vector(6 downto 0);
		HEX2: out std_logic_vector(6 downto 0);
		HEX3: out std_logic_vector(6 downto 0);
		KEY: in std_logic_vector(1 downto 0)
   );
end SevenSegmentsPush;

architecture arch of SevenSegmentsPush is
signal inp : std_logic_vector(3 downto 0);
begin
	process (KEY)
		variable tmp: std_logic_vector(3 downto 0);
			begin
				if (KEY(1)='0') then
					tmp := "0000";
				elsif (rising_edge(KEY(0))) then
					tmp := tmp + "0001";
				end if;
					inp <= tmp;
					
	end process;
 
   with inp select
				HEX0(6 downto 0) <=
					"1000000" when "0000",
					"1111001" when "0001",
					"0100100" when "0010",
					"0110000" when "0011",
					"0011001" when "0100",
					"0010010" when "0101",
					"0000010" when "0110",       	
					"1111000" when "0111",       	
					"0000000" when "1000",       	
					"0011000" when "1001",       	
					"0001000" when "1010", --a       
					"0000011" when "1011", --b       
					"1000110" when "1100", --c       
					"0100001" when "1101", --d       
					"0000110" when "1110", --e       
					"0001110" when others; --f       
   --sseg(7) <= dp;
		HEX1 <= "1111111";
		HEX2 <= "1111111";
		HEX3 <= "1111111";
end arch;