class src_agent_top extends uvm_agent;
	`uvm_component_utils(src_agent_top)
	src_agent agnth; 
	env_config 	e_cfg;

	function new(string name ="src_agent_top",uvm_component parent);
		super.new(name,parent);
	endfunction
	function void build_phase(uvm_phase phase);
	
	if(!uvm_config_db #(env_config)::get(this,"","env_config",e_cfg))
		`uvm_fatal("FAILED","can't getting env_config");
	uvm_config_db #(src_config)::set(this,"*","src_config",e_cfg.src_cfg);
	agnth=src_agent::type_id::create("agnth",this);

		
		super.build_phase(phase);
	endfunction
endclass
	
