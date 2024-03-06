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
    constant initial: std_logic_vector(6 downto 0) := "0000000";
    constant B: std_logic_vector(6 downto 0) := "1100000";
    constant A: std_logic_vector(6 downto 0) := "0001000";
    constant D: std_logic_vector(6 downto 0) := "1000010";
    constant E: std_logic_vector(6 downto 0) := "0110000";
begin

    process(clk, swap)
    begin
        if rising_edge(clk) then
            case ao is
                when initial =>
                    ao <= B;
                when B => --b
                    if swap = '0' then ao <= A; --a
                    elsif swap = '1' then ao <= E; --e
                    end if;
                when A => --a
                    ao <= D; --d
                when D => --d
                    if swap = '0' then ao <= E; --e
                    elsif swap = '1' then ao <= B; --b
                    end if;
                when E => --e
                    if swap = '0' then ao <= B;
                    elsif swap = '1' then ao <= A;
                    end if;
                when others =>
                    ao <= initial;
            end case;
        end if;
    end process;
end architecture;
