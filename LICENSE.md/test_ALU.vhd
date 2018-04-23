--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:32:44 04/08/2018
-- Design Name:   
-- Module Name:   D:/Proyectos_Xilinx/Procesador1/test_ALU.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY test_ALU IS
END test_ALU;
 
ARCHITECTURE behavior OF test_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         entrada_alu_a : IN  std_logic_vector(31 downto 0);
         entrada_alu_b : IN  std_logic_vector(31 downto 0);
         uc_op : IN  std_logic_vector(5 downto 0);
         salida_alu : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
	signal entrada_alu_a : std_logic_vector(31 downto 0) := (others => '0');
   --signal entrada_alu_a : std_logic_vector(31 downto 0) := x"00000003";
   signal entrada_alu_b : std_logic_vector(31 downto 0) := (others => '0');
	--signal entrada_alu_b : std_logic_vector(31 downto 0) := x"00000004";
   signal uc_op : std_logic_vector(5 downto 0) := (others => '0');
	--signal uc_op : std_logic_vector(5 downto 0) :=  "000001";

 	--Outputs
   signal salida_alu : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          entrada_alu_a => entrada_alu_a,
          entrada_alu_b => entrada_alu_b,
          uc_op => uc_op,
          salida_alu => salida_alu
        );

   -- Clock process definitions
   --<clock>_process :process
  -- begin
		--<clock> <= '0';
		--wait for <clock>_period/2;
		--<clock> <= '1';
		--wait for <clock>_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		
		--uc_op <= "000000";
		
		entrada_alu_a <= x"00000001";	
		
		entrada_alu_b <= x"00000002";
		
		uc_op <= "000000";
		
		
		
      wait for 100 ns;	

     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
