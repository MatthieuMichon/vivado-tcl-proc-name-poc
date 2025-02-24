/* vhdl-2008 */
library ieee;
use ieee.std_logic_1164.all;
library unisim;

entity fpga_top is
    port (
        clk_125_p, clk_125_n: in std_ulogic;
        gpio_led: out std_ulogic_vector(8-1 downto 0);
        gpio_dip_sw: in std_ulogic_vector(8-1 downto 0);
        cpu_reset: in std_ulogic
    );
end entity;
architecture a of fpga_top is
    signal clk_125: std_ulogic;
begin

    ibufds_clk_125: unisim.vcomponents.ibufds port map (
        i => clk_125_p, ib => clk_125_n, o => clk_125);

    main_p: process(clk_125) is begin
        if rising_edge(clk_125) then
            if cpu_reset = '1' then
                gpio_led <= (others=>'0');
            else
                gpio_led <= gpio_dip_sw;
            end if;
        end if;
    end process;

end architecture;
