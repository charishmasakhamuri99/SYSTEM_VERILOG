class packet;
  int count;


  function void display(string prefix="");
    $display("%s packet: count=%0d", prefix, count);
  endfunction
endclass


class sample;
  int a;       // Non-object variable
  int b;       // Non-object variable
  packet pck;  // Object variable

  function new();
    pck = new();  
  endfunction

  // Deep copy
  function void deep_copy(sample src);
    this.a = src.a;
    this.b = src.b;
    this.pck = new();               
    this.pck.count = src.pck.count;  
  endfunction

 
  function void display(string prefix="");
    $display("%s sample: a=%0d b=%0d", prefix, a, b);
    pck.display({prefix,"  "});
  endfunction
endclass


module tb;
  sample s1, s2;

  initial begin
    s1 = new();
    s2 = new();

    s2.a = 100;
    s2.pck.count = 50;

    s1.deep_copy(s2);   
    s1.display("s1");
    s2.display("s2");

    $display("---- Modify s2 ----");
    s2.a = 200;
    s2.b = 300;
    s2.pck.count = 600;

    s1.display("s1");
    s2.display("s2");
  end
endmodule
