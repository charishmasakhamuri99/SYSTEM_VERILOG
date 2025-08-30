module tb;
  int data1,data2;
  event done;
  //generator
  task generator();
    for(int i=0;i<=7;i++) begin
      data1=$random();
      $display("generated value=%0d",data1);
      #1;
      #9;
    end
    ->done;
  endtask
    //driver
  task driver();
      forever begin
        #10;
        data2=data1;
        $display("driver value =%0d",data2);
      end
  endtask
    //simulation hold
    task wait_event();
      wait(done.triggered);
      $finish;
    endtask
  initial begin
    fork
    generator();
    driver();
    wait_event();
    join
  end
    
endmodule

