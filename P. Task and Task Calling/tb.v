module top;
  bit[2:0] x;
  bit[2:0] y;
  bit[3:0] z;
  bit clk=0;
  always #10 clk=~clk;
  task add();
    z=x+y;
    $display("x=%0d y=%0d z=%0d",x,y,z);
  endtask
  initial
    begin 
      x=5;
      y=5;
      add();
    end
  task simulation();
    x=6;y=6;#10;
    add();
    x=7;y=8;#10;
    add();
    x=4;y=4;#10;
    add();
  endtask
  task run();
    x=$urandom();
    y=$urandom();
    add();
  endtask
  task clock();
    @(posedge clk) begin
      x=$urandom();
      y=$urandom();
      add();
      clock();
    end
  endtask
  initial
    begin
      clock();
      run();
    end
  initial
    begin
      #200;
      $finish;
    end
