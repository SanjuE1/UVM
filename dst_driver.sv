class dst_driver extends uvm_driver;
	`uvm_component_utils(dst_driver);
	function new(string name ="dst_driver",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass
