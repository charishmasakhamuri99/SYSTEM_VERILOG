class employ;
  int iid=57;
  string name="cherry";
 
endclass
module tb;
  employ e=new;
  initial begin

    $display("string=%0s",e.name);
    $display("int=%0d",e.iid));
  end
endmodule
