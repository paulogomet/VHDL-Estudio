library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xnor_gate is
    port(
        A_xnor : in STD_LOGIC;
        B_xnor : in STD_LOGIC;
        Z_xnor : out STD_LOGIC
    );
end xnor_gate;

architecture Behavioral of xnor_gate is
begin
    process(A_xnor, B_xnor) begin
        if (A_xnor = '0' and B_xnor = '0') or (A_xnor = '1' and B_xnor = '1')
            then Z_xnor <= '1';
        else
            Z_xnor <= '0';
        end if;
    end process;
end Behavioral;

architecture DataFlow of xnor_gate is 
begin
    
    Z_xnor <= A_xnor xnor B_xnor;

end DataFlow;

architecture Structural of xnor_gate is
    component nand_gate is
        Port(
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Z : out STD_LOGIC
        );
    end component;

    signal s1, s2, s3, s4 : STD_LOGIC;
    
begin 
    U1: nand_gate port map (
        A => A_xnor,
        B => B_xnor,
        Z => s1
    );

    U2: nand_gate port map (
        A => A_xnor,
        B => s1,
        Z => s2
    );

    U3: nand_gate port map (
        A => s1,
        B => B_xnor,
        Z => s3
    );

    U4: nand_gate port map (
        A => s2,
        B => s3,
        Z => s4
    );

    U5: nand_gate port map (
        A => s4,
        B => s4,
        Z => Z_xnor
    );
    
end Structural;