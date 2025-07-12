class tb extends uvm_env;
	`uvm_component_utils(tb)
	dst_agent_top 	dst_agt_top;
	src_agent_top	src_agt_top;
	env_config 	e_cfg;
	scoreboard	sb;
	function new(string name ="tb",uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		if(!uvm_config_db #(env_config)::get(this,"","env_config",e_cfg))
			`uvm_fatal("FAILED","can't getting env_config");
		if(e_cfg.has_src_agent)
			begin
				
				src_agt_top=src_agent_top::type_id::create("src_agt_top",this);

			end
		if(e_cfg.has_dst_agent)
			begin				
				dst_agt_top=dst_agent_top::type_id::create("dst_agt_top",this);

			end
		if(e_cfg.has_scoreboard)
			sb=scoreboard::type_id::create("sb",this);
		super.build_phase(phase);
	
		
	endfunction
endclass


