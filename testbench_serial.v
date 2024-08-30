`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2024 11:01:00 AM
// Design Name: 
// Module Name: testbench_serial
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 10ps

module SerialDac_tb;

    // Inputs
    reg data_ready_i;
    reg sysclk;
    reg reset;
    reg sysclk_spi;

    // Outputs
    wire CS_out;
    wire spi_clk;
    wire serial_data_out_0_port;
    wire serial_data_out_1_port;
    wire ldac_port;
    wire reset_DAC;

    // Inout (tri-state)
    wire serial_data2_IO;

    // Instantiate the Unit Under Test (UUT)
    SerialDac uut (
        .data_ready_i(data_ready_i),
        .sysclk(sysclk),
        .reset(reset),
        .sysclk_spi(sysclk_spi),
        .CS_out(CS_out),
        .spi_clk(spi_clk),
        .serial_data_out_0_port(serial_data_out_0_port),
        .serial_data_out_1_port(serial_data_out_1_port),
        .ldac_port(ldac_port),
        .reset_DAC(reset_DAC)
    );

    // Clock generation for sysclk and sysclk_spi (both at 60 MHz, 15 ns period)
    initial begin
        sysclk = 0;
       // sysclk_spi = 0;
        forever begin
            #10 sysclk = ~sysclk;
            //#7.5 sysclk_spi = ~sysclk_spi;
        end
    end

initial begin
        //sysclk = 0;
        sysclk_spi = 0;
        forever begin
           // #7.5 sysclk = ~sysclk;
            #40 sysclk_spi = ~sysclk_spi;
        end
    end

    // Initial Setup
    initial begin
        // Initialize Inputs
        reset = 1;
        data_ready_i = 0;

        // Wait for global reset to finish
        #30;
        reset = 0;

        // Add stimulus here
        #100;
        data_ready_i = 1;  // Simulate data ready event

        #20;
        data_ready_i = 0;

        #200; // Wait some time before finishing the simulation
       /// $finish;
    end
    
 
    
endmodule