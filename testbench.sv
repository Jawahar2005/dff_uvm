// Code your testbench here
// or browse Examples

`include "uvm_macros.svh"
import uvm_pkg::*;

//include classes in order
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module dff_tb_top;
  
  //logic clk;
   
  //Handle for Interface
  dff_interface intf();
  
  initial begin 
    uvm_config_db#(virtual dff_interface)::set(null,"*","vif",intf);
  end
  
  // Instantiation of DFF
  dff dff_inst (	
    .clk(intf.clk),
    .rst(intf.rst),
    .din(intf.din),
    .dout(intf.dout)
  );
  
  
  // Initialization
  initial begin
    intf.din = 1'b0;
    intf.clk = 1'b1;
    intf.rst = 1'b0;
    #5 
    intf.rst = ~intf.rst;
  end
  
  always #5 intf.clk = ~intf.clk;
  
  //calling test
  initial begin
    run_test("dff_test");     
  end
  
  //Reset Test
  initial begin
    #100 intf.rst = ~intf.rst;
    #100 intf.rst = ~intf.rst;
  end
  // Monitoring the signals 
 /* initial begin  
    $monitor("Monitored value at time=%0t, clk=%0b, rst=%0b, din=%0d, dout=%0d", $time, clk, rst, din, dout);
  end*/

  // Dumping signals 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,dff_tb_top);
  end

endmodule
