class dff_driver extends uvm_driver #(dff_sequence_item);
  
  //Factory Registration
  `uvm_component_utils (dff_driver)
  
  //virtual interface
  virtual dff_interface intf;
  
  //Handle creation for dff_sequence_item
  dff_sequence_item sq_item;
  
  //Constructor
  function new (string name = "dff_driver",uvm_component parent);
    super.new (name,parent);
    `uvm_info("driver Class", "constructor", UVM_NONE)
  endfunction
  
  //Build Phase
  function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    `uvm_info("driver Class", "build_phase", UVM_NONE)
    
    if(!uvm_config_db#(virtual dff_interface)::get(this,"","vif",intf))
         `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
    sq_item = dff_sequence_item::type_id::create("sq_item");
  endfunction
  
  //Run Phase
  task run_phase (uvm_phase phase);
    forever begin
      `uvm_info("driver Class", "run_phase", UVM_NONE)
      
      seq_item_port.get_next_item (sq_item);
      drive(sq_item);
      seq_item_port.item_done ();
    end
  endtask
  
  //Drive Task
  task drive (dff_sequence_item sq_item);
    @(posedge intf.clk) 
    `uvm_info("driver class", "drive_task", UVM_NONE)
    
    //intf.rst  = sq_item.rst;
    intf.din  = sq_item.din;
   // intf.dout = sq_item.dout;
  endtask
  
endclass
        
        
