library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nand_gate_tb is

end nand_gate_tb;

architecture Behavioral of nand_gate_tb is
    component nand_gate is
        Port (
            A_nand : in STD_LOGIC;
            B_nand : in STD_LOGIC;
            Z_nand : out STD_LOGIC
        );
    end component;

    signal A_tb : STD_LOGIC := '0';
    signal B_tb : STD_LOGIC := '0';
    signal Z_tb : STD_LOGIC;

begin

    U1: nand_gate port map (
        A_nand => A_tb,
        B_nand => B_tb,
        Z_nand => Z_tb
    );

    proc: process
    begin
        A_tb <= '0';
        B_tb <= '0';
        wait for 10 ns;

        A_tb <= '1';
        B_tb <= '0';
        wait for 10 ns;

        A_tb <= '0';
        B_tb <= '1';
        wait for 10 ns;

        A_tb <= '1';
        B_tb <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;