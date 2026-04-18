library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate is
    Port ( 
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Z : out  STD_LOGIC
    );
end nor_gate;

Architecture Behavioral of nor_gate is
begin
    process(A, B) begin
        if A = '0' and B = '0'
            then Z <= '1';
        else Z <= '0';
        end if;
    end process;
end Behavioral;

Architecture DataFlow of nor_gate is
begin
    
    Z <= A nor B;

end DataFlow;