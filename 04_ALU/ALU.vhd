----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/12/2023 05:29:49 PM
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity ALU is
    Generic (N: integer := 1); 
    port (
             alu_A      :   in std_logic_vector (N-1 downto 0);
             alu_B      :   in std_logic_vector (N-1 downto 0);
             alu_C      :   in std_logic;
             alu_Opcode :   in std_logic_vector (3 downto 0);
             alu_Out    :   out std_logic_vector (N-1 downto 0)
         );
end ALU;

architecture Behavioral of ALU is

    -- Internal signals
    signal temp    :   std_logic_vector (N-1 downto 0) := "0";
    
begin
 
    alu_proc: process (alu_A, alu_B, alu_Opcode)
    begin
        case alu_Opcode is 
            -- Logical Unit
            when "0000" =>  temp <= NOT alu_A;
            when "0001" =>  temp <= NOT alu_B;
            when "0010" =>  temp <= alu_A AND alu_B;
            when "0011" =>  temp <= alu_A OR alu_B;
            when "0100" =>  temp <= alu_A NAND alu_B;
            when "0101" =>  temp <= alu_A NOR alu_B;
            when "0110" =>  temp <= alu_A XOR alu_B;
            when "0111" =>  temp <= alu_A XNOR alu_B;

            -- Arithmetic Unit
            when "1000" =>  temp <= alu_A;
            when "1001" =>  temp <= alu_B;
            when "1010" =>  temp <= alu_A + 1;
            when "1011" =>  temp <= alu_B + 1;
            when "1100" =>  temp <= alu_A - 1;
            when "1101" =>  temp <= alu_B - 1;
            when "1110" =>  temp <= alu_A + alu_B;
            when "1111" =>  temp <= alu_A + alu_B + alu_C;
            when others =>  temp <= temp;  
         end case;  
    end process alu_proc;
    
    alu_Out <= temp;    

end Behavioral;
