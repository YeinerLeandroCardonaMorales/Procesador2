----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:45:22 04/08/2018 
-- Design Name: 
-- Module Name:    register_file_RF - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file_RF is
    Port ( entrada_rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           entrada_rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           registro_destino : in  STD_LOGIC_VECTOR (4 downto 0);
           reset : in  STD_LOGIC;
           entrda_dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           salida_rf1 : out  STD_LOGIC_VECTOR (31 downto 0);
           salida_rf2 : out  STD_LOGIC_VECTOR (31 downto 0)
			  --contenido_registro_destino_crd : out STD_LOGIC_VECTOR (31 downto 0)
			  );
			  
end register_file_RF;

architecture Behavioral of register_file_RF is

type rom_type is array (0 to 31) of std_logic_vector (31 downto 0);

signal reg : rom_type := (others => x"00000000");

	--signal reg : rom_type :=( x"00000000",
		--										  x"00000000",
			--									  x"00000000",
				--								  x"00000000",
					--							  x"00000000",
						--						  x"00000000",
							--					  x"00000000",
								--				  x"00000000",
									--			  x"00000000",
										--		  x"00000000",
											--	  x"00000000",
											--   x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000000",
											--	  x"00000001",
											--	  x"00000000");

begin

process(entrada_rs1,entrada_rs2,registro_destino,reset, entrda_dwr)

begin
	if(reset = '1')then
				salida_rf1 <= (others=>'0');
				salida_rf2 <= (others=>'0');
				--contenido_registro_destino_crd <= (others => '0');
			
				reg <= (others => x"00000001");
			else
				salida_rf1 <= reg(conv_integer(entrada_rs1)); --asigna al registro fuente 1 a la alu
				salida_rf2 <= reg(conv_integer(entrada_rs1)); --debe ir al multiplexor para compararse con el inmediato
				--contenido_registro_destino_crd <= reg(conv_integer(registro_destino));  
				
				
			if(registro_destino  /= "00000")then
					reg(conv_integer(registro_destino)) <= entrda_dwr;
			end if;
	end if;
	
end process;

end Behavioral;

