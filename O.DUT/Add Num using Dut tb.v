class generator;
  int a=5;
  int b=7;
  mailbox mbx;
  task run();
    mbx.put({a[2:0],b[2:0]});//concatination to send all ata time
    $display("generated test cases a:%0d, b=%0d",a,b);
  endtask
endclass
class driver;
  mailbox mbx;
  virtual inter vif;//we can not create the interface inside the class so we are creating the virtual interface after we will link the virtual interface to the originaal interface
  task run();
//     virtual inter vif;
    bit [5:0]temp;//mb take only one bit at a time
    bit [2:0] a,b;//b is stored in lsb and ais stored msb
    mbx.get(temp);
    a=temp[5:3];//we will get the values but get is concatinated values to seperate them again we are mentioning the range for both a,b
    b=temp[2:0];
    vif.a=a;//to send the values to virtual interface
    vif.b=b;
    #15;//this is the time dealy to assign the vlaue to the output it will take some time for the combitional circuits
    $display("driver applied value: a=%0d,b=%0d and the dut output c=%0d",a,b,vif.c);
  endtask
endclass
module tb;
  inter aif();
  add u1(.a(aif.a),.b(aif.b),.c(aif.c));//linking the dut variables to the original interface 
  generator gen;//creating the object for the generarto that is gen
  driver div;
  mailbox mbx;
  initial begin
    gen=new();
    div=new();//assign the memory to the object
    mbx=new();
    gen.mbx=mbx;//equatating the two mboxes are equal for both gen and driver
    div.mbx=mbx;
    div.vif=aif;//linking the virtual interface to actual interface
    fork
      gen.run();//for parallel exectution
      div.run();
    join
  end
  initial begin
    $monitor("c=%0d",aif.c);
  end
endmodule

    
