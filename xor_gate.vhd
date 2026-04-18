library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
    port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Z : out STD_LOGIC
    );
end xor_gate;

architecture Behavioral of xor_gate is
    process(A, B) begin
    
        if (A = '0' and B = '0') or (A = '1' and B = '1')
            then Z <= '0';
    
        else Z <= '1';
    
    end if;
    
    end process;
end Behavioral;

architecture DataFlow of xor_gate is
begin

    Z <= A xor B;

end DataFlow;