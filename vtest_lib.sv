class test extends uvm_test;
	`uvm_component_utils(test)
	dst_config 	dst_cfg[];
	src_config 	src_cfg;
	env_config 	e_cfg;
	tb 		envh;
	bit has_src_agent=1; 
	bit has_dst_agent=1;
	int no_of_srcs=1;
	int no_of_dsts=3;
	

	
	function new(string name="test",uvm_component parent);
		super.new(name,parent);
	endfunction
	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);

		e_cfg=env_config::type_id::create("e_cfg");

		if(e_cfg.has_src_agent)
		begin
			src_cfg = src_config::type_id::create("src_cfg");
			src_cfg.is_active = UVM_ACTIVE;
			e_cfg.src_cfg = src_cfg;
			uvm_config_db #(src_config)::set(this,"*","src_config",e_cfg.src_cfg);

		end
	
		if(e_cfg.has_dst_agent)
		begin
				e_cfg.dst_cfg=new[no_of_dsts];
				dst_cfg=new[no_of_dsts];
				
				foreach(dst_cfg[i])
				begin
			
					dst_cfg[i] = dst_config::type_id::create($sformatf("dst_cfg[%0d]",i));
					dst_cfg[i].is_active = UVM_ACTIVE;
					e_cfg.dst_cfg[i] = dst_cfg[i];
					uvm_config_db #(dst_config)::set(this,$sformatf("agnth[%0d]",i),"dst_config",e_cfg.dst_cfg[i]);
				end
				
				
				
		end
		e_cfg.has_src_agent=has_src_agent;
		e_cfg.has_dst_agent=has_dst_agent;
		e_cfg.no_of_srcs=no_of_srcs;
		e_cfg.no_of_dsts=no_of_dsts;
		envh=tb::type_id::create("envh",this);

		uvm_config_db#(env_config)::set(this,"*","env_config",e_cfg);
		
	endfunction
	
	function void end_of_elaboration_phase(uvm_phase phase);
		super.end_of_elaboration_phase(phase);
		uvm_top.print_topology;
	endfunction 
endclass
