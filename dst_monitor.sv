class dst_monitor extends uvm_monitor;
	`uvm_component_utils(dst_monitor)
	function new(string name ="dst_monitor",uvm_component parent=null);
		super.new(name,parent);
	endfunction
endclass 
