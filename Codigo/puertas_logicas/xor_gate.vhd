library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate is
    port (
        A_xor : in  STD_LOGIC;
        B_xor : in  STD_LOGIC;
        Z_xor : out STD_LOGIC
    );
end xor_gate;




architecture Behavioral of xor_gate is
begin
    process(A_xor, B_xor) begin
    
        if (A_xor = '0' and B_xor = '0') or (A_xor = '1' and B_xor = '1')
            then Z_xor <= '0';
    
        else 
            Z_xor <= '1';
    
        end if;
    
    end process;
end Behavioral;




architecture DataFlow of xor_gate is
begin

    Z_xor <= A_xor xor B_xor;

end DataFlow;




architecture Structural of xor_gate is
    component nand_gate is
        Port (
            A_nand : in STD_LOGIC;
            B_nand : in STD_LOGIC;
            Z_nand : out STD_LOGIC
        );
    end component;

    signal w1, w2, w3 : STD_LOGIC;

begin
    U1: nand_gate port map (
        A_nand => A_xor,
        B_nand => B_xor,
        Z_nand => w1
    );

    U2: nand_gate port map (
        A_nand => A_xor,
        B_nand => w1,
        Z_nand => w2
    );

    U3: nand_gate port map (
        A_nand => w1,
        B_nand => B_xor,
        Z_nand => w3
    );

    U4: nand_gate port map (
        A_nand => w2,
        B_nand => w3,
        Z_nand => Z_xor
    );

end Structural;

    


