--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:21:41 04/08/2018
-- Design Name:   
-- Module Name:   D:/Proyectos_Xilinx/Procesador1/test_nPc.vhd
-- Project Name:  Procesador1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: nPc
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
 
ENTITY test_nPc IS
END test_nPc;
 
ARCHITECTURE behavior OF test_nPc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nPc
    PORT(
         entrada_nPc : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         salida_nPc : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal entrada_nPc : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal salida_nPc : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nPc PORT MAP (
          entrada_nPc => entrada_nPc,
          reset => reset,
          salida_nPc => salida_nPc,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
      wait for 100 ns;
		
		reset <= '0';
		entrada_nPc <= "00000000000000000000000000000111";
		wait for 100 ns;
		
		entrada_nPc <= "00000000000000000000000000000101";
		wait for 100 ns;
		
		entrada_nPc <= "00000000000000000000000000000100";
      wait for 100 ns;	

      --wait for clk_period*10;

      -- insert stimulus here 

      wait;
		
   end process;

END;
