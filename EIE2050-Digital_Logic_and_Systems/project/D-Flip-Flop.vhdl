library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF is
    Port ( d : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           q : out  STD_LOGIC);
end D_FF;

architecture Behavioral of D_FF is
begin
process (clk, rst)
begin
    if rst = '1' then
        q <= '0';
    elsif rising_edge(clk) then
        q <= d;
    end if;
end process;
end Behavioral;
