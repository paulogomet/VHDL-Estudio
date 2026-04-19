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
            A_nand : in STD_LOGIC;
            B_nand : in STD_LOGIC;
            Z_nand : out STD_LOGIC
        );
    end component;

    signal s1, s2, s3, s4 : STD_LOGIC;
    
begin 
    U1: nand_gate port map (
        A_nand => A_xnor,
        B_nand => B_xnor,
        Z_nand => s1
    );

    U2: nand_gate port map (
        A_nand => A_xnor,
        B_nand => s1,
        Z_nand => s2
    );

    U3: nand_gate port map (
        A_nand => s1,
        B_nand => B_xnor,
        Z_nand => s3
    );

    U4: nand_gate port map (
        A_nand => s2,
        B_nand => s3,
        Z_nand => s4
    );

    U5: nand_gate port map (
        A_nand => s4,
        B_nand => s4,
        Z_nand => Z_xnor
    );
    
end Structural;