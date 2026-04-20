library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_ff_tb is
end t_ff_tb;

architecture Behavioral of t_ff_tb is
    component t_ff is
        Port ( 
            clk_t : in  STD_LOGIC;
            clr_t : in  STD_LOGIC;
            set_t : in STD_LOGIC;
            t : in  STD_LOGIC;
            q_t : out  STD_LOGIC;
            not_q_t : out STD_LOGIC
        );
    end component;

    signal clk_tb : STD_LOGIC := '0';
    signal clr_tb : STD_LOGIC := '0';
    signal set_tb : STD_LOGIC := '0';
    signal t_tb : STD_LOGIC := '0';
    signal q_t_tb : STD_LOGIC;
    signal not_q_t_tb : STD_LOGIC;

begin

    U1: t_ff port map (
        clk_t => clk_tb,
        clr_t => clr_tb,
        set_t => set_tb,
        t => t_tb,
        q_t => q_t_tb,
        not_q_t => not_q_t_tb
    );

    clk_proc: process
    begin
        loop
            clk_tb <= '0'; wait for 5 ns;
            clk_tb <= '1'; wait for 5 ns;
        end loop;
    end process;

    stim_proc: process
    begin

        set_tb <= '1'; wait for 20 ns;
        set_tb <= '0'; wait for 20 ns;

        clr_tb <= '1'; wait for 20 ns;
        clr_tb <= '0'; wait for 10 ns;

        -- no toggle period
        t_tb <= '0'; wait for 40 ns;

        -- enable toggle: q should flip on every rising edge while t= '1'
        t_tb <= '1'; wait for 160 ns;

        -- disable toggle
        t_tb <= '0'; wait for 40 ns;

        -- short toggle bursts
        t_tb <= '1'; wait for 40 ns;
        t_tb <= '0'; wait for 20 ns;
        t_tb <= '1'; wait for 40 ns;

        -- apply async reset during operation
        clr_tb <= '1'; wait for 12 ns;
        clr_tb <= '0'; wait for 20 ns;

        wait for 40 ns;
        assert true report "Simulacion finalizada" severity note;
        wait;
    
    end process;

end Behavioral;
    