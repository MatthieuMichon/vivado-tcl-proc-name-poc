package require Vivado

# ------------------------------------------------------------------------------
# Build FPGA Gateware
# ------------------------------------------------------------------------------

proc generate_firmware {} {

    # Initialize the Vivado project

        set_param messaging.defaultLimit 999999
        set_param general.maxThreads 8
        create_project -in_memory -part xczu7ev-ffvc1156-2-e

    # Load source files

        read_vhdl -vhdl2008 [glob ../*.vhd]
        read_xdc [glob ../*.xdc]

    # Build firmware

        synth_design -top fpga_top -debug_log -verbose
        opt_design -debug_log -verbose
        place_design -timing_summary -debug_log -verbose
        phys_opt_design -verbose
        route_design -debug_log -verbose
        phys_opt_design -verbose

    # Generate reports

        report_io -file io_report.txt -quiet

    # Generate bitstream

        set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
        set_property BITSTREAM.CONFIG.USR_ACCESS TIMESTAMP [current_design]
        write_bitstream -force -file fpga.bit -verbose

    # Write project

        write_checkpoint -force build.dcp

}

# ------------------------------------------------------------------------------

# Perplexingly the changing the name of the following method effects the final
# outcome.

proc 7_user_proc {} {
    puts "hello"
}

# ------------------------------------------------------------------------------

7_user_proc
generate_firmware
