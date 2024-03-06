library ieee;
use ieee.std_logic_1164.all;

entity jkff is
    port(
        clk: in std_logic;
        J: in std_logic;
        K: in std_logic;
        Q: out std_logic;
        QB: out std_logic
    );
end jkff;

architecture rtl of jkff is
     signal tmp: std_logic; --used to temporarily store the output
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if J = '0' and K = '0' then 
                tmp <= tmp; --no change
            elsif J = '1' and K = '1' then
                tmp <= not tmp;
            elsif J = '0' and K = '1' then
                tmp <= '0';
            else -- J ='1' and K = '0'
                tmp <= '1';
            end if;
        end if;
    end process;
    Q <= tmp;
    QB <= not tmp;
end architecture;
