library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not_gate is
    port(
        A_not : in STD_LOGIC;
        Z_not : out STD_LOGIC
    );
end not_gate;

architecture Behavioral of not_gate is
begin
    process(A_not) begin
        if A_not = '0'
            then Z_not <= '1';
        else
            Z_not <= '0';
        end if;

    end process; 
    
end Behavioral;

architecture DataFlow of not_gate is
begin 
      
    Z_not <= not A_not;  
    
end DataFlow;

architecture Structural of not_gate is
    component nand_gate is
        Port (
            A_nand : in STD_LOGIC;
            B_nand : in STD_LOGIC;
            Z_nand : out STD_LOGIC
        );
    end component;

begin 
    U1: nand_gate port map (
        A_nand => A_not,
        B_nand => A_not,
        Z_nand => Z_not
    );
end Structural;