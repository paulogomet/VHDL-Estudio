library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate is
    port(
        A_and : in STD_LOGIC;
        B_and : in STD_LOGIC;
        Z_and : out STD_LOGIC
    );
end and_gate;



architecture Behavioral of and_gate is
begin 
    process (A_and, B_and) begin
        if A_and = '1' and B_and = '1'
            then Z_and <= '1';
        else 
            Z_and <= '0';
        end if;
    end process;
end Behavioral;



architecture DataFlow of and_gate is
begin
    Z_and <= A_and and B_and;
end DataFlow;



architecture Structural of and_gate is
    component nand_gate is 
        Port(
            A_nand : in STD_LOGIC;
            B_nand : in STD_LOGIC;
            Z_nand : out STD_LOGIC
        );
    end component;

    signal s1 : STD_LOGIC;

begin
    U1: nand_gate port map(
        A_nand => A_and,
        B_nand => B_and,
        Z_nand => s1
    );

    U2: nand_gate port map(
        A_nand => s1,
        B_nand => s1,
        Z_nand => Z_and
    );

end Structural;