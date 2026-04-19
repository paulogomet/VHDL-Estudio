library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or_gate_tb is

end or_gate_tb;

architecture Behavioral of or_gate_tb is
    component or_gate is
        Port (
            A_or : in STD_LOGIC;
            B_or : in STD_LOGIC;
            Z_or : out STD_LOGIC
        );
    end component;

    signal A_tb : STD_LOGIC := '0';
    signal B_tb : STD_LOGIC := '0';
    signal Z_tb : STD_LOGIC;

begin

    U1: or_gate port map (
        A_or => A_tb,
        B_or => B_tb,
        Z_or => Z_tb
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