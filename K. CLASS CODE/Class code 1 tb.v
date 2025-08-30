class employ;
  int iid;
  string name;
  function new(int iid = 75,string name= "fg");
    this.iid =iid;
    this.name = name;
  endfunction
  function int getId();
    return iid;
  endfunction
  function string getName();
    return name;
  endfunction
endclass
module tb;
  employ e=new(75,"fg");
  initial begin
    $display("string=%0s",e.getName());
    $display("int=%0d",e.getId());
  end
endmodule
