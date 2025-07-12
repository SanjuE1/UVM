class src_driver extends uvm_driver;
	`uvm_component_utils(src_driver);
	function new(string name ="src_driver",uvm_component parent);
		super.new(name,parent);
	endfunction
endclass

