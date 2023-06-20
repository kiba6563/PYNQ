----------------------------------------------------------------------------------
-- 
-- Test bench for ALU 
-- 
----------------------------------------------------------------------------------

-- Library
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity, no ports 
entity ALU_tb is
--  Port ( );
end ALU_tb;

-- Architecture
architecture Behavioral of ALU_tb is

    -- Component declaration of UUT
    component ALU 
        Generic (N: integer := 1);
        port
            (
                alu_A       :   in std_logic_vector (N-1 downto 0);
                alu_B       :   in std_logic_vector (N-1 downto 0);
                alu_C       :   in std_logic;
                alu_Opcode  :   in std_logic_vector (3 downto 0);
                alu_Out     :   out std_logic_vector (N-1 downto 0)            
            );
    end component;
    
    -- Test bench signals
    signal alu_A_tb      :   std_logic_vector (0 downto 0);
    signal alu_B_tb      :   std_logic_vector (0 downto 0);
    signal alu_C_tb      :   std_logic;
    signal alu_Opcode_tb :   std_logic_vector (3 downto 0);
    signal alu_Out_tb    :   std_logic_vector (0 downto 0);
    
begin

    -- UUT instantiation
    UUT : ALU
    port map (
                alu_A       =>  alu_A_tb,
                alu_B       =>  alu_B_tb,
                alu_C       =>  alu_C_tb,
                alu_Opcode  =>  alu_Opcode_tb,
                alu_Out     =>  alu_Out_tb
             );
     
     -- Stimulus
     stim_proc : process
     begin
        -- Test cases for Logical Unit
        wait for 10ns;
        alu_A_tb <= "0";
        alu_B_tb <= "1";
        alu_C_tb <= '0';
        alu_Opcode_tb <= "0000";    -- NOT alu_A
        wait for 10ns;
        alu_Opcode_tb <= "0001";    -- NOT alu_B
        wait for 10ns;
        alu_Opcode_tb <= "0010";    -- AND operation      
        wait for 10ns;
        alu_A_tb <= "1";
        alu_B_tb <= "1";
        alu_Opcode_tb <= "0011";    -- OR operation    
        wait for 10ns;
        alu_A_tb <= "1";
        alu_B_tb <= "1";
        alu_Opcode_tb <= "0100";    -- NAND operation
        wait for 10ns;
        alu_Opcode_tb <= "0101";    -- NOR operation
        wait for 10ns;
        alu_A_tb <= "1";
        alu_B_tb <= "1";
        alu_Opcode_tb <= "0110";    -- XOR operation
        wait for 10ns;
        alu_Opcode_tb <= "0111";    -- XNOR operation  
        
        -- Test cases for Arithmetic Unit
        wait for 10ns;
        alu_A_tb <= "0";
        alu_Opcode_tb <= "1000";    -- pass alu_A
        wait for 10ns;
        alu_B_tb <= "1";
        alu_Opcode_tb <= "1001";    -- pass alu_B
        wait for 10ns;
        alu_Opcode_tb <= "1010";    -- alu_A + 1
        wait for 10ns;
        alu_Opcode_tb <= "1011";    -- alu_B + 1                           
        wait for 10ns;
        alu_Opcode_tb <= "1100";    -- alu_A - 1
        wait for 10ns;
        alu_Opcode_tb <= "1101";    -- alu_B - 1
        wait for 10ns;
        alu_Opcode_tb <= "1110";    -- alu_A + alu_B
        wait for 10ns;
        alu_C_tb <= '1';
        alu_Opcode_tb <= "1111";    -- alu_A + alu_B + alu_C
        wait for 10ns;
        alu_A_tb <= "1";
        alu_B_tb <= "0";   
        alu_C_tb <= '0';  
        alu_Opcode_tb <= "0000";                                                           
     end process stim_proc;
             
end Behavioral;
