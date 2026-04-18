library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Z : out STD_LOGIC
    );
end or_gate;

architecture Behavioral of or_gate is
begin
    process(A, B) begin
    
        if A = '1' or B = '1'
            then Z <= '1';
        else Z <= '0';
    
        end if;
    
    end process;

end Behavioral;

architecture DataFlow of or_gate is
begin 
    Z <= A or B;
end DataFlow;