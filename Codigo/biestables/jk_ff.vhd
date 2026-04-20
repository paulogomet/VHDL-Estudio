library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff is
    Port (
        clk_jk  : in std_logic;
        clr_jk  : in std_logic;
        set_jk  : in std_logic;
        j       : in std_logic;
        k       : in std_logic;
        q_jk    : out std_logic;
        not_q_jk: out std_logic
    );
end jk_ff;

architecture Behavioral of jk_ff is

    signal q_reg : std_logic := '0';

begin
    process (clk_jk, clr_jk, set_jk)
    begin
        if clr_jk = '1' then
            q_reg <= '0';
        
        elsif set_jk = '1' then
            q_reg <= '1';
        
        elsif rising_edge(clk_jk) then
            if j = '0' and k = '1' then
                q_reg <= '0';
            
            elsif j = '1' and k = '0' then
                q_reg <= '1';
            
            elsif j = '1' and k = '1' then
                q_reg <= not q_reg;

            end if;
        end if;
    end process;

    q_jk <= q_reg;
    not_q_jk <= not q_reg;
        
    
end Behavioral;