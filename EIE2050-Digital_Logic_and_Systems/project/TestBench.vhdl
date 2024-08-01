library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sipo_shift_register_tb is
end sipo_shift_register_tb;

architecture sim of sipo_shift_register_tb is
    signal clk : STD_LOGIC := '0';
    signal rst : STD_LOGIC := '0';
    signal din : STD_LOGIC := '0';
    signal dout : STD_LOGIC_VECTOR (0 to 7) := (others => '0');

    component sipo_shift_register is
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               din : in STD_LOGIC;
               dout : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

begin
    DUT: sipo_shift_register port map (clk, rst, din, dout);

    -- Clock generation
    clk_process : process
    begin
        wait for 40 ns;
        clk <= not clk;
    end process;

    -- Testbench stimulus
    stimulus_process : process
    begin
        rst <= '1';
        din <= '0';
        wait for 60 ns;
        rst <= '0';
        din <= '0';
        wait for 70 ns;
        din <= '1';
        wait for 240 ns;
        din <= '0';
        wait for 80 ns;
        din <= '1';
        wait for 120 ns;
        din <= '0';
        wait for 240 ns;
        din <= '1';
        wait for 80 ns;
        din <= '0';
        wait for 400 ns;
        rst <= '1';
        wait for 40 ns;
        rst <= '0';
        din <= '0';
        wait;
    end process;

end sim;