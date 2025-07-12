class dst_agent_top extends uvm_agent;
	`uvm_component_utils(dst_agent_top);
	dst_agent agnth[];
	env_config 	e_cfg;

	function new(string name ="dst_agent_top",uvm_component parent);
		super.new(name,parent);
	endfunction
	function void build_phase(uvm_phase phase);
	if(!uvm_config_db #(env_config)::get(this,"","env_config",e_cfg))
		`uvm_fatal("FAILED","can't getting env_config");
				agnth=new[e_cfg.no_of_dsts];
				foreach(agnth[i])
					begin
						agnth[i]=dst_agent::type_id::create($sformatf("agnth[%0d]",i),this);
						uvm_config_db #(dst_config)::set(this,$sformatf("agnth[%0d]",i),"dst_config",e_cfg.dst_cfg[i]);
					end
		super.build_phase(phase);
		
		
	endfunction
endclass
	
