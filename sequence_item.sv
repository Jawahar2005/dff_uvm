class dff_sequence_item extends uvm_sequence_item;
  
  //Factory Registration
  `uvm_object_utils (dff_sequence_item)
  
  //Paramater 
  parameter WIDTH = 4;
  
  //Sequence_items
  logic clk,rst;
  rand logic [WIDTH-1:0] din;
  logic [WIDTH-1:0] dout;
  
  //Constructor
  function new(string name = "dff_sequence_item");
    super.new(name);
    `uvm_info("sequence item Class", "constructor", UVM_NONE)
  endfunction
  
endclass
  
  
  
  
  
