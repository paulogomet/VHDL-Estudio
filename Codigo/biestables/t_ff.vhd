library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity t_ff is
    Port ( 
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
        t : in  STD_LOGIC;
        q : out  STD_LOGIC;
        not_q : out STD_LOGIC
    );

end t_ff;

architecture Behavioral of t_ff is
    
    signal q_reg : STD_LOGIC := '0';

begin 
    process(rst, clk)
    begin
        if rst = '1' then
            q_reg <= '0';

        elsif rising_edge(clk) then

            if t = '1' then
                q_reg <= not q_reg;
            end if;
        end if;
    
    end process;

    q <= q_reg;
    not_q <= not q_reg;

end Behavioral;

    

