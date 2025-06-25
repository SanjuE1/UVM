`include "uvm_macros.svh"
 import uvm_pkg::*;
 
class wr_xtn extends uvm_sequence_item;
`uvm_object_utils(wr_xtn)
	rand bit[2:0] a;
	rand bit[2:0] b;
	rand bit[2:0] c;
/*	`uvm_object_utils_begin(wr_xtn)
	`uvm_field_int(a,UVM_ALL_ON)
	`uvm_field_int(b,UVM_ALL_ON)
	`uvm_field_int(c,UVM_ALL_ON)
	`uvm_object_utils_end
	*/
	function new(string name ="wr_xtn");
		super.new(name);
	endfunction
	
	virtual function void do_copy(uvm_object rhs);
		wr_xtn h2;
		if(!$cast(h2,rhs))
			begin
				`uvm_fatal("COPY","casting is failed")
			end
			super.do_copy(rhs);
			this.a=h2.a;
			this.b=h2.b;
			this.c=h2.c;
	endfunction
	
	
	
	virtual function bit do_compare(uvm_object rhs,uvm_comparer comparer);
		wr_xtn h2;
		if(!$cast(h2,rhs))
			begin
				`uvm_fatal("COMPARE","casting is failed")
				return 0;
			end
		return 
			super.do_compare(rhs,comparer)&&
			this.a==h2.a&&
			this.b==h2.b&&
			this.c==h2.c;
	endfunction
	
	virtual function void do_print(uvm_printer  printer);
		printer.print_field("a",a,8,UVM_DEC);
		printer.print_field("b",b,8,UVM_DEC);
		printer.print_field("c",c,8,UVM_DEC);
	endfunction

			
endclass:wr_xtn

module test;
	wr_xtn h3,h4;
	initial begin 
	h3=new();
	h4=new();
	assert(h3.randomize());
	h3.print(uvm_default_tree_printer);
	h4.copy(h3);
	h4.print(uvm_default_line_printer);
	if(!h3.compare(h4))
		$display("wrong");
		else
		$display("success");
	end
endmodule
	
	
