library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff_tb is
end jk_ff_tb;

architecture Behavioral of jk_ff_tb is
    component jk_ff is
        Port(
            clk_jk : in std_logic;
            clr_jk : in std_logic;
            set_jk : in std_logic;
            j : in std_logic;
            k : in std_logic;
            q_jk : out std_logic;
            not_q_jk : out std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal clr : std_logic := '0';
    signal set : std_logic := '0';
    signal j_tb : std_logic := '0';
    signal k_tb : std_logic := '0';
    signal q_jk_tb : std_logic;
    signal not_q_jk_tb : std_logic;


begin

    U1 : jk_ff port map (
        clk_jk => clk,
        clr_jk => clr,
        set_jk => set,
        j => j_tb,
        k => k_tb,
        q_jk => q_jk_tb,
        not_q_jk => not_q_jk_tb
    );

    clk_proc: process
    begin
        loop
            clk <= '0'; wait for 5 ns;
            clk <= '1'; wait for 5 ns;
        end loop;
    end process;

    
    stim_proc: process
    begin
        set <= '1'; wait for 20 ns;
        set <= '0'; wait for 10 ns;

        clr <= '1'; wait for 10 ns;
        clr <= '0'; wait for 10 ns;

        j_tb <= '1'; k_tb <= '0'; wait for 10 ns;
        j_tb <= '1'; k_tb <= '1'; wait for 20 ns;
        j_tb <= '0'; k_tb <= '1'; wait for 10 ns;

        wait;
        
        assert true report "Simulacion finalizada" severity note;

    end process;


end Behavioral;