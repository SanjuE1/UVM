class src_agent extends uvm_agent;
	`uvm_component_utils(src_agent)
		src_config 	e_cfg;
		src_driver 	w_drvh;
		src_monitor 	w_monh;
		src_sequencer	 w_seqrh;
	function new(string name="src_agent",uvm_component parent);
		super.new(name,parent);
	endfunction

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
			if(!uvm_config_db #(src_config)::get(this,"","src_config",e_cfg))
				`uvm_fatal("FAILED WR_AGENT","can't getting config data");
			w_monh= src_monitor::type_id::create("w_monh",this);
	
			if(e_cfg.is_active==UVM_ACTIVE)	
				begin
				w_drvh	=src_driver	::type_id::create("w_drvh",this);
				w_seqrh=src_sequencer	::type_id::create("w_seqrh",this);
				end
	endfunction
endclass

