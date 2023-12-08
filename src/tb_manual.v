`default_nettype none
`timescale 1ns/1ps

module tb_manual ();

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb_manual.vcd");
        $dumpvars (0, tb_manual);
	
	rst_n = 0;
	clk = 0;
	#1 clk = 1;
	#1 clk = 0;
	#1 rst_n = 1;

	#40 $finish;
    end

    // wire up the inputs and outputs
    reg  clk;
    reg  rst_n;
    reg  ena;
    reg  [7:0] ui_in;
    reg  [7:0] uio_in;

    wire [3:0] counter_out = uo_out[3:0];
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    wire [7:0] uio_oe;

    tt_um_kvosic_counter ctr0 (
    // include power ports for the Gate Level test
    `ifdef GL_TEST
        .VPWR( 1'b1),
        .VGND( 1'b0),
    `endif
        .ui_in      (ui_in),    // Dedicated inputs
        .uo_out     (uo_out),   // Dedicated outputs
        .uio_in     (uio_in),   // IOs: Input path
        .uio_out    (uio_out),  // IOs: Output path
        .uio_oe     (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
        .ena        (ena),      // enable - goes high when design is selected
        .clk        (clk),      // clock
        .rst_n      (rst_n)     // not reset
        );

    always begin
	#1 clk = ~clk;
    end

endmodule

