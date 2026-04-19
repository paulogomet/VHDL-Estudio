library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and_gate_tb is

end and_gate_tb;

architecture Behavioral of and_gate is
    component and_gate is
        Port (
            A_and : in STD_LOGIC;
            B_and : in STD_LOGIC;
            Z_and : out STD_LOGIC
        );
    end component;

    signal A_tb : STD_LOGIC := '0';
    signal B_tb : STD_LOGIC := '0';
    signal Z_tb : STD_LOGIC;

begin

    U1: and_gate port map (
        A_and => A_tb,
        B_and => B_tb,
        Z_and => Z_tb
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