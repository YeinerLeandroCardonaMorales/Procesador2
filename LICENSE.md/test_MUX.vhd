--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:19:45 04/16/2018
-- Design Name:   
-- Module Name:   D:/Proyectos_Xilinx/Procesador2/test_MUX.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX_multiplexor
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_MUX IS
END test_MUX;
 
ARCHITECTURE behavior OF test_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX_multiplexor
    PORT(
         intput_salida_rf2 : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         intput_output_SEU_to_MUX : IN  std_logic_vector(31 downto 0);
         output_MUX_to_ALU : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal intput_salida_rf2 : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';
   signal intput_output_SEU_to_MUX : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal output_MUX_to_ALU : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX_multiplexor PORT MAP (
          intput_salida_rf2 => intput_salida_rf2,
          i => i,
          intput_output_SEU_to_MUX => intput_output_SEU_to_MUX,
          output_MUX_to_ALU => output_MUX_to_ALU
        );

   -- Clock process definitions
   --<clock>_process :process
   --begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
  -- end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		intput_salida_rf2 <= x"00000000";
		
		i <= '1';
		
		intput_output_SEU_to_MUX <= x"00000001";
		
		

			

      --wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
