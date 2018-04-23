----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:19:09 04/16/2018 
-- Design Name: 
-- Module Name:    MUX_multiplexor - Behavioral 
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

entity MUX_multiplexor is
    Port ( intput_salida_rf2 : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           intput_output_SEU_to_MUX : in  STD_LOGIC_VECTOR (31 downto 0);
           output_MUX_to_ALU : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_multiplexor;

architecture Behavioral of MUX_multiplexor is

begin

	process ( intput_salida_rf2, i, intput_output_SEU_to_MUX)
	
		begin
			if (i = '1') then
				output_MUX_to_ALU <= intput_output_SEU_to_MUX;
			else
				output_MUX_to_ALU <= intput_salida_rf2;
			end if;
			
	end process;


end Behavioral;

