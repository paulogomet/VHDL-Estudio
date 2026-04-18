library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate is
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Z : out STD_LOGIC
    );
end nand_gate; 

Architecture Behavioral of nand_gate is
begin
    process(A, B) begin
        if A = '1' and B = '1'
            then Z <= '0';
        else
            Z <= '1';
        end if;
    end process;
end Behavioral;

Architecture DataFlow of nand_gate is
begin

    Z <= A nand B;

end DataFlow;


