library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xnor_gate_tb is

end xnor_gate_tb;

architecture Behavioral of xnor_gate_tb is
    component xnor_gate is
        Port (
            A_xnor : in STD_LOGIC;
            B_xnor : in STD_LOGIC;
            Z_xnor : out STD_LOGIC
        );
    end component;

    signal A_tb : STD_LOGIC := '0';
    signal B_tb : STD_LOGIC := '0';
    signal Z_tb : STD_LOGIC;

begin

    U1: xnor_gate port map (
        A_xnor => A_tb,
        B_xnor => B_tb,
        Z_xnor => Z_tb
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