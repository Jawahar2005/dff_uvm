class dff_monitor extends uvm_monitor;

  //Factory Registration
  `uvm_component_utils (dff_monitor)

  //Virtual Interface
  virtual dff_interface intf;

  //Handle Creation for dff_squence_item 
  dff_sequence_item sq_item;

  //Analysis Port
  uvm_analysis_port #(dff_sequence_item) item_collected_port;

  //Constructor
  function new(string name ="dff_monitor", uvm_component parent);
    super.new (name, parent);
    `uvm_info("monitor Class", "constructor", UVM_NONE)
  endfunction

  //Build Phase
  function void build_phase (uvm_phase phase);
    super.build_phase (phase);
    `uvm_info("monitor Class", "build_phase", UVM_NONE)
    item_collected_port = new("item_collected_port" , this);
    sq_item = dff_sequence_item ::type_id::create("sq_item");

    if(!uvm_config_db #(virtual dff_interface) :: get(this,"","vif",intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  endfunction

  //Run Task
  task run_phase (uvm_phase phase);
    super.run_phase (phase);
    forever @(posedge intf.clk) begin
      `uvm_info("monitor class", "run_task", UVM_NONE)
      sq_item.rst  = intf.rst;
      sq_item.din  = intf.din;
      sq_item.dout = intf.dout;

    item_collected_port.write(sq_item);
    end
  endtask

endclass

