library IEEE;
use IEEE.std_logic_1164.all;

entity d_ff is
    Port (
        clk : in std_logic;
        rst : in std_logic;
        d : in std_logic;
        q_d : out std_logic;
        not_q_d : out std_logic
    );
end d_ff;

architecture behavioral of d_ff is
    
    signal q_d_reg : std_logic;

begin
    process(rst, clk)
    begin
        if rst = '1' then
            q_d_reg <= '0';

        elsif rising_edge(clk) then
            if d = '1' then
                q_d_reg <= '1';

            else
                q_d_reg <= '0';
            
            end if; 
        end if;
    end process;
    
    q_d <= q_d_reg;
    not_q_d <= not q_d_reg;

end behavioral;
        