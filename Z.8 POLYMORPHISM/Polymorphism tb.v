class remort;
  virtual function void presspower();//with out the virtual keyword base class handle is again pointing the base class
    $display("Default:No device selected");
  endfunction
endclass
class fan extends remort;
  function void presspower();
    $display("fan on/off");
  endfunction
endclass
class ac extends remort;
  function void presspower();
    $display("ac on/off");
  endfunction
endclass
class light extends remort;
  function void presspower();
    $display("light on/off");
  endfunction
endclass
module tb;
  remort device[3];
  initial begin
    //in polymorphism we are going to assign single base class is assign todifferent child classes
    device[0]=fan::new();
    device[1]=ac::new();
    device[2]=light::new();
    foreach (device[i]) device[i].presspower();
  end
endmodule
  
