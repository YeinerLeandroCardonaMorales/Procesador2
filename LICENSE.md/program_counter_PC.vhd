----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:29:34 04/05/2018 
-- Design Name: 
-- Module Name:    program_counter_PC - Behavioral 
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

entity program_counter_PC is
    Port ( entrada_pc : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           salida_pc : in  STD_LOGIC_VECTOR (31 downto 0));
			  
end program_counter_PC;

architecture Behavioral of program_counter_PC is

begin


end Behavioral;

