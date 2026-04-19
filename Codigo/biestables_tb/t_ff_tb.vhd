library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_ff_tb is
end t_ff_tb;

architecture Behavioral of t_ff_tb is
    component t_ff is
        Port ( 
            clk : in  STD_LOGIC;
            rst : in  STD_LOGIC;
            t : in  STD_LOGIC;
            q : out  STD_LOGIC;
            not_q : out STD_LOGIC
        );
    end component;

    signal clk_tb : STD_LOGIC := '0';
    signal rst_tb : STD_LOGIC := '0';
    signal t_tb : STD_LOGIC := '0';
    signal q_tb : STD_LOGIC;
    signal not_q_tb : STD_LOGIC;

begin

    U1: t_ff port map (
        clk => clk_tb,
        rst => rst_tb,
        t => t_tb,
        q => q_tb,
        not_q => not_q_tb
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
        rst_tb <= '1'; wait for 20 ns;
        rst_tb <= '0'; wait for 10 ns;

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
        rst_tb <= '1'; wait for 12 ns;
        rst_tb <= '0'; wait for 20 ns;

        wait for 40 ns;
        assert true report "Simulaci�n finalizada" severity note;
        wait;
    
    end process;

end Behavioral;
    