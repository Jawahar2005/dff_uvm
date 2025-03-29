class dff_sequence extends uvm_sequence;
  //Factory Registration
  `uvm_object_utils (dff_sequence)
  
  //Handle creation for dff_sequence_item
  dff_sequence_item sq_item;
  
  //Constructor
  function new(string name = "dff_sequence");
    super.new (name);
    `uvm_info("sequence Class", "constructor", UVM_NONE)
  endfunction
  
/*  //Build Function
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("sequence Class", "build_phase", UVM_NONE)
    sq_item = dff_sequence_item::type_id::create("sq_item",this);
    
  endfunction
*/ 
  
  //Task Body
  task body();
    repeat(100) begin
      sq_item = dff_sequence_item::type_id::create("sq_item");
      
      start_item(sq_item);
      sq_item.din =$random;
      finish_item(sq_item);
    end
  endtask  

endclass    
