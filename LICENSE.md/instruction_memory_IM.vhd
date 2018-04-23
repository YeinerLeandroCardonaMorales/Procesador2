----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:46:34 04/08/2018 
-- Design Name: 
-- Module Name:    instruction_memory_IM - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_memory_IM is
    Port (
			--clk : in STD_LOGIC;
			address : in  STD_LOGIC_VECTOR (31 downto 0);
         reset : in  STD_LOGIC;
         out_instruction : out  STD_LOGIC_VECTOR (31 downto 0));
			
end instruction_memory_IM;

architecture Behavioral of instruction_memory_IM is

	type rom_type is array (0 to 2) of std_logic_vector (31 downto 0);
	
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
	
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector (31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type 'range loop readline (RomFile, RomFileLine);
			read (RomFileLine, temp_bv);
			temp_mem (i) := to_stdlogicvector (temp_bv);
			end loop;
		return temp_mem;
		
end function;
		
		signal instructions : rom_type := InitRomFromFile ("testJMPL.data");

begin
	
	
	process(reset,address,instructions)
	begin
	
			if (reset = '1') then
				out_instruction <= (others => '0');
			else
				out_instruction <= instructions(conv_integer(address(5 downto 0)));
			end if;
			
	end process;
			

end Behavioral;

