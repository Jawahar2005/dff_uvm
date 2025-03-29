class dff_sequencer extends uvm_sequencer #(dff_sequence_item);
  
  //Factory Registration
  `uvm_component_utils (dff_sequencer)
  
  //Constructor
  function new (string name ="dff_sequencer", uvm_component parent);
    super.new (name, parent);
    `uvm_info("sequencer Class", "constructor", UVM_NONE)
  endfunction
  
endclass
