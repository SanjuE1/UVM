class env_config extends uvm_object;
	`uvm_object_utils(env_config)
	function new(string name="env_config");
		super.new(name);
	endfunction
	
	src_config src_cfg;
	dst_config dst_cfg[];
	bit has_src_agent=1;
	bit has_dst_agent=1;
	bit has_scoreboard=1;
	int no_of_srcs=1;
	int no_of_dsts=1;
endclass
