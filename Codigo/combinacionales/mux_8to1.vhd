library ieee;
use ieee.std_logic_1164.all;

entity mux_8to1 is
    Port (
        data_in : in std_logic_vector(7 downto 0);
        sel : in std_logic_vector(2 downto 0);
        z_8to1 : out std_logic
    );

end mux_8to1;


architecture Structural of mux_8to1 is
    component mux_2to1 is
        Port (
            a : in std_logic;
            b : in std_logic;
            s : in std_logic;
            z : out std_logic
        );
    end component;

    signal sig_z: std_logic_vector(5 downto 0);

begin
    U1 : mux_2to1 port map (
        a => data_in(0),
        b => data_in(1),
        s => sel(0),
        z => sig_z(0)
    );

    U2 : mux_2to1 port map (
        a => data_in(2),
        b => data_in(3),
        s => sel(0),
        z => sig_z(1)
    );

    U3 : mux_2to1 port map (
        a => data_in(4),
        b => data_in(5),
        s => sel(0),
        z => sig_z(2)
    );

    U4 : mux_2to1 port map (
        a => data_in(6),
        b => data_in(7),
        s => sel(0),
        z => sig_z(3)
    );

    U5 : mux_2to1 port map (
        a => sig_z(0),
        b => sig_z(1),
        s => sel(1),
        z => sig_z(4)
    );

    U6 : mux_2to1 port map (
        a => sig_z(2),
        b => sig_z(3),
        s => sel(1),
        z => sig_z(5)
    );

    U7 : mux_2to1 port map (
        a => sig_z(4),
        b => sig_z(5),
        s => sel(2),
        z => z_8to1
    );


end architecture;