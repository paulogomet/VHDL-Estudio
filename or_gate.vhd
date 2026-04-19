library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate is
    port(
        A_or : in STD_LOGIC;
        B_or : in STD_LOGIC;
        Z_or : out STD_LOGIC
    );
end or_gate;


architecture Behavioral of or_gate is
begin
    process(A_or, B_or) begin
    
        if A_or = '1' or B_or = '1'
            then Z_or <= '1';
        else Z_or <= '0';
    
        end if;
    
    end process;

end Behavioral;



architecture DataFlow of or_gate is
begin 
    Z_or <= A_or or B_or;
end DataFlow;


architecture Structural of or_gate is

    component nand_gate is 
        Port (
            A: in STD_LOGIC;
            B: in STD_LOGIC;
            Z: out STD_LOGIC
        );
    end component;

    signal s1, s2 : STD_LOGIC;

begin
    U1: nand_gate port map(
        A => A_or,
        B => A_or,
        Z => s1
    );

    U2: nand_gate port map(
        A => B_or,
        B => B_or,
        Z => s2
    );

    U3: nand_gate port map(
        A => s1,
        B => s2,
        Z => Z_or
    );

end Structural;