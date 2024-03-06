library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is 
    port(
        clk: in std_logic;
        preset: in std_logic_vector(3 downto 0);
        ud: in std_logic;
        enable: in std_logic;
        load: in std_logic;
        Q: out std_logic_vector(3 downto 0) := "0000"; --just for the simulator to work
        max: out std_logic;
        RCO: out std_logic
    );
end counter;

architecture rtl of counter is

begin
    process(clk, enable, load) --makes enable and load asynchronous 
    begin
        if load = '0' then --if load is '0' then Q becomes preset
            Q <= preset;
        elsif enable = '1' then --if enable is '1' then Q doesn't change
            Q <= Q;
        elsif rising_edge(clk) and enable = '0' then
            if ud = '0' then --counts up
                Q <= std_logic_vector(unsigned(Q) + 1); --type conversion to be able to add 1 to vector
                -- first it converts Q to an unsigned integer, then it adds 1, then it converts the integer back to vector
            elsif ud = '1' then --counts down
                Q <= std_logic_vector(unsigned(Q) - 1);
            end if;
        end if;
    end process;

    RCO <= '0' when falling_edge(clk) and Q = "1111" else '1'; --on the falling edge of the clock and when it is 15
    max <= '1' when Q = "1111" else '0'; --when it is 15

end architecture;
