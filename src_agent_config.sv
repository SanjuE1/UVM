class src_config extends uvm_object;
	`uvm_object_utils(src_config)
	function new(string name="src_config");
		super.new(name);
	endfunction
	uvm_active_passive_enum is_active=UVM_ACTIVE;
	
endclass

