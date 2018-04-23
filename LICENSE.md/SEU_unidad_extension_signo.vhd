----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:01:35 04/16/2018 
-- Design Name: 
-- Module Name:    SEU_unidad_extension_signo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU_unidad_extension_signo is
    Port ( input_SEU : in  STD_LOGIC_VECTOR (12 downto 0);
           output_to_MUX : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU_unidad_extension_signo;

architecture Behavioral of SEU_unidad_extension_signo is

begin

process ( input_SEU)

	begin
	
		output_to_MUX (12 downto 0) <= input_SEU;
	
		if (input_SEU (12) = '1' ) then
			output_to_MUX (31 downto 13) <= "1111111111111111111";
		else
			output_to_MUX (31 downto 13) <= "0000000000000000000";
		end if;
		
		--//

		--if (input_SEU (12) ) = '1' then
		--if (input_SEU (12) = '1' ) then
			--output_to_MUX (12 downto 0) <= input_SEU;
			--output_to_MUX (12 downto 0) = input_SEU
			--output_to_MUX (31 downto 13) <= "1111111111111111111";
		--else 
			--output_to_MUX (12 downto 0) <= input_SEU;
			--output_to_MUX (31 downto 13) <= "0000000000000000000";
		--end if;
		
		--//
		
end process;

end Behavioral;

