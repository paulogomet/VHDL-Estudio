library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        Z : out STD_LOGIC
    );
end and_gate;

architecture Behavioral of and_gate is
begin 
    process (A, B) begin
        if A = '1' and B = '1'
            then Z <= '1';
        else 
            Z <= '0';
        end if;
    end process;
end Behavioral;

architecture DataFlow of and_gate is
begin
    Z <= A and B;
end DataFlow;