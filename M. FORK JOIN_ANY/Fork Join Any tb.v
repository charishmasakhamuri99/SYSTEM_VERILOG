//any one of the task is finished at task1 and then join_Any will execute and then remaining will execute in the fork
module tb;
  task one();
    $display("task1 is started at:%0t",$time);
    #20;
    $display("task1 is completed at:%0t",$time);
  endtask
   task two();
     $display("task2 is started at:%0t",$time);
    #10;
     $display("task2 is completed at:%0t",$time);
  endtask
   task three();
     $display("task3 is started at:%0t",$time);
  endtask
  initial begin
    fork
      one();
      two();
    join_any
    three();
  end
endmodule
// OUTPUT:
// task1 is started at:0
// task2 is started at:0
// task2 is completed at:10
// task3 is started at:10
// task1 is completed at:20
