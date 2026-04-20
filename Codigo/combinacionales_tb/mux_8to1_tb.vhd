library ieee;
use ieee.std_logic_1164.all;

entity mux_8to1_tb is
end mux_8to1_tb;

architecture Behavioral of mux_8to1_tb is
    component mux_8to1 is
        Port (
            data_in : in  std_logic_vector(7 downto 0);
            sel     : in  std_logic_vector(2 downto 0);
            z_8to1  : out std_logic
        );
    end component;

    signal sig_data   : std_logic_vector(7 downto 0) := (others => '0');
    signal sig_sel    : std_logic_vector(2 downto 0) := (others => '0');
    signal sig_z_8to1 : std_logic;
begin

    UUT : mux_8to1
        port map (
            data_in => sig_data,
            sel     => sig_sel,
            z_8to1  => sig_z_8to1
        );

    stim_proc : process
    begin
        -- test sel = 0, expect LSB
        sig_data <= "00000001"; sig_sel <= "000"; wait for 10 ns;
        assert sig_z_8to1 = '1' report "FAIL: sel=0" severity error;

        -- test sel = 1
        sig_data <= "00000010"; sig_sel <= "001"; wait for 10 ns;
        assert sig_z_8to1 = '1' report "FAIL: sel=1" severity error;

        -- test sel = 2
        sig_data <= "00000100"; sig_sel <= "010"; wait for 10 ns;
        assert sig_z_8to1 = '1' report "FAIL: sel=2" severity error;

        -- test sel = 3
        sig_data <= "00001000"; sig_sel <= "011"; wait for 10 ns;
        assert sig_z_8to1 = '1' report "FAIL: sel=3" severity error;

        -- test sel = 4
        sig_data <= "00010000"; sig_sel <= "100"; wait for 10 ns;
        assert sig_z_8to1 = '1' report "FAIL: sel=4" severity error;

        -- test sel = 5
        sig_data <= "00100000"; sig_sel <= "101"; wait for 10 ns;
        assert sig_z_8to1 = '1' report "FAIL: sel=5" severity error;

        -- test sel = 6
        sig_data <= "01000000"; sig_sel <= "110"; wait for 10 ns;
        assert sig_z_8to1 = '1' report "FAIL: sel=6" severity error;

        -- test sel = 7
        sig_data <= "10000000"; sig_sel <= "111"; wait for 10 ns;
        assert sig_z_8to1 = '1' report "FAIL: sel=7" severity error;

        report "Simulación finalizada OK" severity note;
        wait;
    end process;

end Behavioral;