class src_monitor extends uvm_monitor;
	`uvm_component_utils(src_monitor);
	function new(string name ="src_monitor",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

