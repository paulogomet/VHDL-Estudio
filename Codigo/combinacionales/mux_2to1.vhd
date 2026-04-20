-- OPCIONAL 1: Realice en un nuevo proyecto, similar al obligatorio, donde implemente un multiplexor 
-- de dos canales de datos y extiéndalo para diseñar un multiplexor de 8 canales de datos.

-- OPCIONAL 2: Realice en un nuevo proyecto, similar al obligatorio, donde implemente un decodificador
-- de dos canales de entrada con entrada enable activa a nivel alto y extiéndalo para diseñar un decodificador 
-- de 8 canales de entrada con enable activo a nivel BAJO.

-- OPCIONAL 3: Realice en un nuevo proyecto, similar al obligatorio, donde implemente otras puertas, no 
-- básicas, como pueden ser: NAND, NOR, XOR, XNOR y AOI de dos entradas. Puede completar el diseño de puertas 
-- hecho, implementando las mismas con un mayor número de entradas. Utilice, para este apartado, 
-- la propiedad del VHDL que permite los diseños genéricos/reusables.


library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
    Port (
        a : in std_logic;
        b : in std_logic;
        s : in std_logic;
        z : out std_logic
    );
end mux_2to1;


architecture Behavioral of mux_2to1 is
begin

    z <= a when s = '0' else b;
    
end Behavioral;

