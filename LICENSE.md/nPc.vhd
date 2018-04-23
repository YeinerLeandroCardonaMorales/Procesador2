----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:31 04/08/2018 
-- Design Name: 
-- Module Name:    nPc - Behavioral 
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

entity nPc is
    Port ( entrada_nPc : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           salida_nPc : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC);
end nPc;

architecture Behavioral of nPc is

begin

	process (entrada_nPc, reset, clk)
   begin
     if(reset = '1')then
	    salida_nPc <= "00000000000000000000000000000000";
		else
        if(rising_edge(clk))then
		    salida_nPc <= entrada_nPc;
		  end if;
	  end if;
	  
end process;


end Behavioral;

