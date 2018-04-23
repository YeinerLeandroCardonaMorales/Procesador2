--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:53:27 04/08/2018
-- Design Name:   
-- Module Name:   D:/Proyectos_Xilinx/Procesador1/test_register_file_RF.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: register_file_RF
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_register_file_RF IS
END test_register_file_RF;
 
ARCHITECTURE behavior OF test_register_file_RF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_file_RF
    PORT(
         entrada_rs1 : IN  std_logic_vector(4 downto 0);
         entrada_rs2 : IN  std_logic_vector(4 downto 0);
         registro_destino : IN  std_logic_vector(4 downto 0);
         reset : IN  std_logic;
         entrda_dwr : IN  std_logic_vector(31 downto 0);
         salida_rf1 : OUT  std_logic_vector(31 downto 0);
         salida_rf2 : OUT  std_logic_vector(31 downto 0)
			--contenido_registro_destino_crd : OUT std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal entrada_rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal registro_destino : std_logic_vector(4 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal entrda_dwr : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal salida_rf1 : std_logic_vector(31 downto 0);
   signal salida_rf2 : std_logic_vector(31 downto 0);
	--signal contenido_registro_destino_crd : OUT std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_file_RF PORT MAP (
          entrada_rs1 => entrada_rs1,
          entrada_rs2 => entrada_rs2,
          registro_destino => registro_destino,
          reset => reset,
          entrda_dwr => entrda_dwr,
          salida_rf1 => salida_rf1,
          salida_rf2 => salida_rf2
			 --contenido_registro_destino_crd => contenido_registro_destino_crd
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		reset <='1';
      wait for 100 ns;
		
		reset <='0';
		
		entrada_rs1<= "10000";
		
		entrada_rs2 <= "10001";
		
		registro_destino <= "00001";
		
		entrda_dwr <= x"00000001";
		
      --wait for <clock>_period*10;

      -- insert stimulus here 

      --wait;
   end process;

END;
