# Clock

set_property PACKAGE_PIN H9 [get_ports clk_125_p]; # Bank 68 VCCO - VADJ_FMC - IO_L11P_T1U_N8_GC_68
set_property PACKAGE_PIN G9 [get_ports clk_125_n]; # Bank 68 VCCO - VADJ_FMC - IO_L11N_T1U_N9_GC_68
set_property IOSTANDARD LVDS [get_ports clk_125*];
create_clock -period 8.0 [get_ports clk_125_p];

# PL-side LEDs

set_property PACKAGE_PIN AL11 [get_ports gpio_led[0]]; # Bank 66 VCCO - VCC1V2 - IO_L8P_T1L_N2_AD5P_66
set_property PACKAGE_PIN AL13 [get_ports gpio_led[1]]; # Bank 66 VCCO - VCC1V2 - IO_L7N_T1L_N1_QBC_AD13N_66
set_property PACKAGE_PIN AK13 [get_ports gpio_led[2]]; # Bank 66 VCCO - VCC1V2 - IO_L7P_T1L_N0_QBC_AD13P_66
set_property PACKAGE_PIN AE15 [get_ports gpio_led[3]]; # Bank 64 VCCO - VCC1V2 - IO_L19N_T3L_N1_DBC_AD9N_64
set_property PACKAGE_PIN AM8 [get_ports gpio_led[4]]; # Bank 66 VCCO - VCC1V2 - IO_L6N_T0U_N11_AD6N_66
set_property PACKAGE_PIN AM9 [get_ports gpio_led[5]]; # Bank 66 VCCO - VCC1V2 - IO_L6P_T0U_N10_AD6P_66
set_property PACKAGE_PIN AM10 [get_ports gpio_led[6]]; # Bank 66 VCCO - VCC1V2 - IO_L5N_T0U_N9_AD14N_66
set_property PACKAGE_PIN AM11 [get_ports gpio_led[7]]; # Bank 66 VCCO - VCC1V2 - IO_L5P_T0U_N8_AD14P_66
set_property IOSTANDARD LVCMOS12 [get_ports gpio_led];
set_false_path -to [get_ports gpio_led]

# PL-side DIP switches

set_property PACKAGE_PIN A17 [get_ports gpio_dip_sw[0]]; # Bank 67 VCCO - VADJ_FMC - IO_L1P_T0L_N0_DBC_67
set_property PACKAGE_PIN A16 [get_ports gpio_dip_sw[1]]; # Bank 67 VCCO - VADJ_FMC - IO_L1N_T0L_N1_DBC_67
set_property PACKAGE_PIN B16 [get_ports gpio_dip_sw[2]]; # Bank 67 VCCO - VADJ_FMC - IO_L2P_T0L_N2_67
set_property PACKAGE_PIN B15 [get_ports gpio_dip_sw[3]]; # Bank 67 VCCO - VADJ_FMC - IO_L2N_T0L_N3_67
set_property PACKAGE_PIN A15 [get_ports gpio_dip_sw[4]]; # Bank 67 VCCO - VADJ_FMC - IO_L3P_T0L_N4_AD15P_67
set_property PACKAGE_PIN A14 [get_ports gpio_dip_sw[5]]; # Bank 67 VCCO - VADJ_FMC - IO_L3N_T0L_N5_AD15N_67
set_property PACKAGE_PIN B14 [get_ports gpio_dip_sw[6]]; # Bank 67 VCCO - VADJ_FMC - IO_L4P_T0U_N6_DBC_AD7P_67
set_property PACKAGE_PIN B13 [get_ports gpio_dip_sw[7]]; # Bank 67 VCCO - VADJ_FMC - IO_L4N_T0U_N7_DBC_AD7N_67
set_property IOSTANDARD LVCMOS18 [get_ports gpio_dip_sw];
set_false_path -from [get_ports gpio_dip_sw]

# PL-side reset switch

set_property PACKAGE_PIN G13 [get_ports cpu_reset]; # Bank 68 VCCO - VADJ_FMC - IO_T2U_N12_68
set_property IOSTANDARD LVCMOS18 [get_ports cpu_reset];
set_false_path -from [get_ports cpu_reset]
