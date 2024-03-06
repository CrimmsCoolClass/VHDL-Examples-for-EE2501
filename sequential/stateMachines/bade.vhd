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
                    ao <= "1100000";
                when "1100000" => --b
                    if swap = '0' then ao <= "0001000"; --a
                    elsif swap = '1' then ao <= "0110000"; --e
                    end if;
                when "0001000" => --a
                    ao <= "1000010"; --d
                when "1000010" => --d
                    if swap = '0' then ao <= "0110000"; --e
                    elsif swap = '1' then ao <= "1100000"; --b
                    end if;
                when "0110000" => --e
                    if swap = '0' then ao <= "1100000";
                    elsif swap = '1' then ao <= "0001000";
                    end if;
                when others =>
                    ao <= "0000000";
            end case;
        end if;
    end process;
end architecture;
