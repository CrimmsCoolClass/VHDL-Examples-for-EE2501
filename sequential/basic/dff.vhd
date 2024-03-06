--
library ieee;
use ieee.std_logic_1164.all;

entity dff is --d type flip flop
    port(
        clk: in std_logic;
        d: in std_logic;
        q: out std_logic
    );
end dff;

architecture rtl of dff is

begin
    process(clk) --everything in this block is evaulated based on the changing of clk
    begin
        if rising_edge(clk) then --on the rising edge of the clock pulse
            q <= d; -- output q is whatever input d is
        end if;
    end process;
--Q only changes when the clock is at the rising edge
end architecture;
