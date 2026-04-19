library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate is
    Port ( 
        A_nor : in  STD_LOGIC;
        B_nor : in  STD_LOGIC;
        Z_nor : out  STD_LOGIC
    );
end nor_gate;

Architecture Behavioral of nor_gate is
begin
    process(A_nor, B_nor) begin
        if A_nor = '0' and B_nor = '0'
            then Z_nor <= '1';
        else Z_nor <= '0';
        end if;
    end process;
end Behavioral;

Architecture DataFlow of nor_gate is
begin
    
    Z_nor <= A_nor nor B_nor;

end DataFlow;

Architecture Structural of nor_gate is
    
    component nand_gate is
        Port(
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Z : out STD_LOGIC
        );
    end component;

    signal s1, s2, s3 : STD_LOGIC;

begin 
    U1: nand_gate port map(
        A => A_nor,
        B => A_nor,
        Z => s1
    );

    U2: nand_gate port map(
        A => B_nor,
        B => B_nor,
        Z => s2
    );

    U3: nand_gate port map(
        A => s1,
        B => s2,
        Z => s3
    );

    U4: nand_gate port map(
        A => s3,
        B => s3,
        Z => Z_nor
    );

end Structural;

