--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:51:15 04/08/2018
-- Design Name:   
-- Module Name:   D:/Proyectos_Xilinx/Procesador1/test_program_counter_PC.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: progam_counter_PC
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
 
ENTITY test_program_counter_PC IS
END test_program_counter_PC;
 
ARCHITECTURE behavior OF test_program_counter_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT progam_counter_PC
    PORT(
         entrada_PC : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         salida_PC : OUT  std_logic_vector(31 downto 0);
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_PC : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal salida_PC : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: progam_counter_PC PORT MAP (
          entrada_PC => entrada_PC,
          reset => reset,
          salida_PC => salida_PC,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
      wait for 100 ns;
		
		reset <= '0';
		entrada_PC <= x"00000003";
		wait for 100 ns;
		
		entrada_PC <= x"00000005";
		wait for 100 ns;
		
		entrada_PC <= x"00000004";
      wait for 100 ns;	

      wait for CLK_period*10;
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
