----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:50:24 04/08/2018 
-- Design Name: 
-- Module Name:    progam_counter_PC - Behavioral 
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

entity progam_counter_PC is
    Port ( entrada_PC : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           salida_PC : out  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC);
end progam_counter_PC;

architecture Behavioral of progam_counter_PC is

begin

	 process (entrada_PC, reset, CLK)
   begin
     if(reset = '1')then
	   salida_PC <= "00000000000000000000000000000000";
		else
        if(rising_edge(CLK))then
		    salida_PC <= entrada_PC;
		  end if;
	  end if;
	  
end process;


end Behavioral;

