class dff_scoreboard extends uvm_scoreboard;

  // Factory Registration
  `uvm_component_utils(dff_scoreboard)

  // Analysis Port
  uvm_analysis_imp#(dff_sequence_item, dff_scoreboard) item_collected_export;
  
  //Virtual Interface
  virtual dff_interface intf;

  // Queue to store din values
  //logic sq_item_q[$];

  // Constructor
  function new(string name = "dff_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("Scoreboard Class", "constructor", UVM_NONE)
  endfunction

  // Build phase
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("scoreboard", "build_phase", UVM_NONE)
    item_collected_export = new("item_collected_export", this);
    if(!uvm_config_db #(virtual dff_interface) :: get(this,"","vif",intf))
      `uvm_fatal("no_inif in driver","virtual interface get failed from config db");
  endfunction

  // Write function
  virtual function void write(dff_sequence_item sq_item);
    `uvm_info("scoreboard", "write function", UVM_NONE)
    if (intf.rst) begin
      if(sq_item.dout !== sq_item.din) begin
        $error("[%0t] din:%0d doesn't matches with dout:%0d. TEST FAILED ",$time, sq_item.din, sq_item.dout );
      end
      else begin
        $display ("[%0t] din:%0d matches with dout:%0d. TEST PASSED ",$time, sq_item.din, sq_item.dout);
      end
    end
    else begin
      if (sq_item.dout == 0) begin
        $display ("[%0t] Reset Test at rst = %0d dout:%0d. TEST PASSED",$time, intf.rst, sq_item.dout);
      end
      else begin
        $error("[%0t] Reset Test at rst = %0d dout not equal to %0d. TEST FAILED",$time, intf.rst, sq_item.dout );
      end
    end
  endfunction

endclass
