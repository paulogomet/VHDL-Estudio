library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_ff is
    Port ( 
        clk_t : in  STD_LOGIC;
        clr_t : in  STD_LOGIC;
        set_t : in STD_LOGIC;
        t : in  STD_LOGIC;
        q_t : out  STD_LOGIC;
        not_q_t : out STD_LOGIC
    );

end t_ff;

architecture Behavioral of t_ff is
    
    signal q_t_reg : STD_LOGIC := '0';

begin 
    process(clr_t, set_t, clk_t)
    begin
        if clr_t = '1' then
            q_t_reg <= '0';
        
        elsif set_t = '1' then
            q_t_reg <= '1';

        elsif rising_edge(clk_t) then

            if t = '1' then
                q_t_reg <= not q_t_reg;
            end if;
        end if;
    
    end process;

    q_t <= q_t_reg;
    not_q_t <= not q_t_reg;

end Behavioral;

    

