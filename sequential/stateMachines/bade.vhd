library ieee;
use ieee.std_logic_1164.all;

entity statemachine is
    port(
        clk: in std_logic;
        swap: in std_logic;
        ao: out std_logic_vector (6 downto 0)
    );
end statemachine;

architecture behavior of statemachine is
begin

    process(clk, swap)
    begin
        if rising_edge(clk) then
            case ao is
                when "0000000" => --initial
                    ao <= "0011111";
                when "0011111" => --b
                    if swap = '0' then ao <= "1110111"; --a
                    elsif swap = '1' then ao <= "1001111"; --e
                    end if;
                when "1110111" => --a
                    ao <= "0111101"; --d
                when "0111101" => --d
                    if swap = '0' then ao <= "1001111"; --e
                    elsif swap = '1' then ao <= "0011111"; --b
                    end if;
                when "1001111" => --e
                    if swap = '0' then ao <= "0011111";
                    elsif swap = '1' then ao <= "1110111";
                    end if;
                when others =>
                    ao <= "0000000";
            end case;
        end if;
    end process;
end architecture;
