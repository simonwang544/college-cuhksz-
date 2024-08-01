library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sipo_shift_register is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           din : in STD_LOGIC;
           dout : out STD_LOGIC_VECTOR (0 to 7));
end sipo_shift_register;

architecture Structural of sipo_shift_register is
    signal internal_dff : STD_LOGIC_VECTOR (0 to 7);
    component d_ff is
        Port ( clk : in STD_LOGIC;
               d : in STD_LOGIC;
               rst : in STD_LOGIC;
               q : out STD_LOGIC);
    end component;
begin
    gen_dff: for i in 0 to 7 generate
        signal dff_input : STD_LOGIC;
    begin
        dff_input <= din when i = 0 else internal_dff(i-1);
        dff_inst : d_ff port map (
            clk => clk,
            rst => rst,
            d => dff_input,
            q => internal_dff(i)
        );
    end generate;

    dout <= internal_dff;
end Structural;