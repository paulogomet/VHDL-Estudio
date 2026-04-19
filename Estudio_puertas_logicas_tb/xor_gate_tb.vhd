library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gate_tb is

end xor_gate_tb;

architecture Behavioral of xor_gate_tb is
    component xor_gate is
        Port (
            A_xor : in STD_LOGIC;
            B_xor : in STD_LOGIC;
            Z_xor : out STD_LOGIC
        );
    end component;

    signal A_tb : STD_LOGIC := '0';
    signal B_tb : STD_LOGIC := '0';
    signal Z_tb : STD_LOGIC;

begin

    U1: xor_gate port map (
        A_xor => A_tb,
        B_xor => B_tb,
        Z_xor => Z_tb
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