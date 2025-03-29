class dff_test extends uvm_test;
  
  //Factory Registration
  `uvm_component_utils (dff_test);
  
  //Handle Creation
  dff_environment env;
  dff_sequence seq;
  
  //Constructor
  function new (string name ="dff_test", uvm_component parent);
    super.new (name, parent);
    `uvm_info("Test Class", "constructor", UVM_NONE)
  endfunction
  
  //Build phase
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("Test Class", "build phase", UVM_NONE)
    env = dff_environment ::type_id::create("env", this);
    seq = dff_sequence ::type_id::create("seq",this);
  endfunction
  
  //Connect phase
  function void connect_phase (uvm_phase phase);
    super.connect_phase (phase);
    `uvm_info("Test Class", "connect phase", UVM_NONE)
  endfunction
  
  //End of elaboration
  virtual function void end_of_elaboration();
    `uvm_info("Test Class", "elob phase", UVM_NONE)
     print();
  endfunction
  
  //run phase
  task run_phase(uvm_phase phase);
    `uvm_info("test Class", "run_phase", UVM_NONE)

    phase.raise_objection(this); 
    seq.start(env.agent.seqr); 
    phase.drop_objection(this);
    
  endtask 
endclass
