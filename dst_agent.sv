class dst_agent extends uvm_agent;
	`uvm_component_utils(dst_agent)
	
	dst_config 	e_cfg;
	dst_driver 	r_drvh;
	dst_monitor 	r_monh;
	dst_sequencer 	r_seqrh;
	
	function new(string name="dst_agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
			if(!uvm_config_db #(dst_config)::get(this,"","dst_config",e_cfg))
				`uvm_fatal("FAILED RD_AGENT","can't getting config data");
			r_monh= dst_monitor::type_id::create("r_monh",this);
	
			if(e_cfg.is_active==UVM_ACTIVE)	
				begin
				r_drvh	=dst_driver	::type_id::create("r_drvh",this);
				r_seqrh=dst_sequencer	::type_id::create("r_seqrh",this);
				end
	endfunction
endclass

