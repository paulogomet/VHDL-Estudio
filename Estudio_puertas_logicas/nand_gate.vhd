library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate is
    port(
        A_nand : in STD_LOGIC;
        B_nand : in STD_LOGIC;
        Z_nand : out STD_LOGIC
    );
end nand_gate; 

Architecture Behavioral of nand_gate is
begin
    process(A_nand, B_nand) begin
        if A_nand = '1' and B_nand = '1'
            then Z_nand <= '0';
        else
            Z_nand <= '1';
        end if;
    end process;
end Behavioral;

Architecture DataFlow of nand_gate is
begin

    Z_nand <= A_nand nand B_nand;

end DataFlow;


