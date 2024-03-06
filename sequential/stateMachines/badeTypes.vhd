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
type StateType is (B,A,D,E); --creates a new type called StateType
signal state: StateType; --assigns a signal to this type
begin

    process(clk, swap)
    begin
        if rising_edge(clk) then
            case state is
                when B => --same concept as with constants
                    if swap = '0' then state <= A; --a
                    elsif swap = '1' then state <= E; --e
                    end if;
                when A => --a
                    state <= D; --d
                when D => --d
                    if swap = '0' then state <= E; --e
                    elsif swap = '1' then state <= B; --b
                    end if;
                when E => --e
                    if swap = '0' then state <= B;
                    elsif swap = '1' then state <= A;
                    end if;
                when others =>
                    state <= B;
            end case;
        end if;
    end process;

    ao <= "1100000" when state = B else --need to manually assign output based on state
          "0001000" when state = A else
          "1000010" when state = D else
          "0110000" when state = E else "0000000";
end architecture;
