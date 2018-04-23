----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:30:02 04/18/2018 
-- Design Name: 
-- Module Name:    Procesador2 - arq_procesador2 
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

entity Procesador2 is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           salidaProcesador2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador2;

architecture arq_procesador2 of Procesador2 is

COMPONENT sumador
	PORT(
		a : IN std_logic_vector(31 downto 0);
		b : IN std_logic_vector(31 downto 0);          
		c : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT nPc
	PORT(
		entrada_nPc : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		salida_nPc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT progam_counter_PC
	PORT(
		entrada_PC : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		CLK : IN std_logic;          
		salida_PC : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instruction_memory_IM
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		out_instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT UC
	PORT(
		entrada_OP : IN std_logic_vector(1 downto 0);
		entrada_OP3 : IN std_logic_vector(5 downto 0);          
		salida_uc_op : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT register_file_RF
	PORT(
		entrada_rs1 : IN std_logic_vector(4 downto 0);
		entrada_rs2 : IN std_logic_vector(4 downto 0);
		registro_destino : IN std_logic_vector(4 downto 0);
		reset : IN std_logic;
		entrda_dwr : IN std_logic_vector(31 downto 0);          
		salida_rf1 : OUT std_logic_vector(31 downto 0);
		salida_rf2 : OUT std_logic_vector(31 downto 0)
		
		);
	END COMPONENT;
	
	COMPONENT MUX_multiplexor
	PORT(
		intput_salida_rf2 : IN std_logic_vector(31 downto 0);
		i : IN std_logic;
		intput_output_SEU_to_MUX : IN std_logic_vector(31 downto 0);          
		output_MUX_to_ALU : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU_unidad_extension_signo
	PORT(
		input_SEU : IN std_logic_vector(12 downto 0);          
		output_to_MUX : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		entrada_alu_a : IN std_logic_vector(31 downto 0);
		entrada_alu_b : IN std_logic_vector(31 downto 0);
		uc_op : IN std_logic_vector(5 downto 0);          
		salida_alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	

signal sumadorToNPC,npcTopc,pcToim,imToucrfseu, aluresult,rfToalu1,rfTomux,seuTomux,muxToalu: STD_LOGIC_VECTOR (31 downto 0);

signal ucToalu : STD_LOGIC_VECTOR (5 downto 0);

begin

	Inst_sumador: sumador PORT MAP(
		a => x"00000001",
		b => pcToim,
		c => sumadorToNPC
	);
	
	Inst_nPc: nPc PORT MAP(
		entrada_nPc => sumadorToNPC,
		reset => reset ,
		salida_nPc => npcTopc ,
		clk => clk
	);
	
	Inst_progam_counter_PC: progam_counter_PC PORT MAP(
		entrada_PC => npcTopc ,
		reset => reset,
		salida_PC => pcToim,
		CLK => CLK
	);
	
	Inst_instruction_memory_IM: instruction_memory_IM PORT MAP(
		address => pcToim,
		reset => reset,
		out_instruction => imToucrfseu
	);
	
		Inst_UC: UC PORT MAP(
		entrada_OP => imToucrfseu (31 downto 30),
		entrada_OP3 => imToucrfseu (24 downto 19),
		salida_uc_op => ucToalu 
	);
	
	Inst_register_file_RF: register_file_RF PORT MAP(
		entrada_rs1 => imToucrfseu (18 downto 14) ,
		entrada_rs2 => imToucrfseu (4 downto 0) ,
		registro_destino => imToucrfseu (29 downto 25) ,
		reset => reset ,
		entrda_dwr => aluresult ,
		salida_rf1 => rfToalu1 ,
		salida_rf2 => rfTomux 
		
	);
	
	Inst_MUX_multiplexor: MUX_multiplexor PORT MAP(
		intput_salida_rf2 => rfTomux,
		i => imToucrfseu (13)  ,
		intput_output_SEU_to_MUX => seuTomux ,
		output_MUX_to_ALU => muxToalu
	);
	
	Inst_SEU_unidad_extension_signo: SEU_unidad_extension_signo PORT MAP(
		input_SEU => imToucrfseu (12 downto 0),
		output_to_MUX => seuTomux
	);
	
	Inst_ALU: ALU PORT MAP(
		entrada_alu_a => rfToalu1,
		entrada_alu_b => muxToalu ,
		uc_op => ucToalu  ,
		salida_alu => aluresult
	);
	
	salidaProcesador2 <= aluresult;



end arq_procesador2;

