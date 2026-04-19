library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nor_gate_tb is

end nor_gate_tb;

architecture Behavioral of nor_gate_tb is
    component nor_gate is
        Port (
            A_nor : in STD_LOGIC;
            B_nor : in STD_LOGIC;
            Z_nor : out STD_LOGIC
        );
    end component;

    signal A_tb : STD_LOGIC := '0';
    signal B_tb : STD_LOGIC := '0';
    signal Z_tb : STD_LOGIC;

begin

    U1: nor_gate port map (
        A_nor => A_tb,
        B_nor => B_tb,
        Z_nor => Z_tb
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