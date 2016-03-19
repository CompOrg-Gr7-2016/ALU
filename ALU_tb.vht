-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/18/2016 19:42:13"
                                                            
-- Vhdl Test Bench template for design  :  ALU
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ALU_vhd_tst IS
END ALU_vhd_tst;
ARCHITECTURE ALU_arch OF ALU_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC := '0';
SIGNAL funct : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL opcode : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL port_1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL port_2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL result : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL shamt : STD_LOGIC_VECTOR(4 DOWNTO 0);
COMPONENT ALU
	PORT (
	clk : IN STD_LOGIC;
	funct : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	opcode : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	port_1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	port_2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	shamt : IN STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ALU
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	funct => funct,
	opcode => opcode,
	port_1 => port_1,
	port_2 => port_2,
	result => result,
	shamt => shamt
	);

clk <= not clk after 10 ns;

init : PROCESS                                               
-- variable declarations                                     
BEGIN         
       funct <= "101010";
       shamt <= "00110";           
       port_1 <= x"00000003";           
       port_2 <= x"00000004";           
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END ALU_arch;
