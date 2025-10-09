// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module teacher_module(college_if.teacher c_if);
  initial begin
    c_if.classroom_math     = 8'd85; 
    c_if.classroom_physics  = 8'd90;  
    c_if.classroom_lab      = 8'd95;   
    #10;
  end
endmodule

module principal_module(college_if.principal c_if);
  initial begin
    #5;
    $display("T=%0t,Principal checks: Math=%0d, Physics=%0d,lab=%0d",$time, c_if.classroom_math, c_if.classroom_physics, c_if.classroom_lab);
    c_if.classroom_lab = 8'd99; 
  end
endmodule

module student_module(college_if.student c_if);
  initial begin
    #15;
    $display("T=%0t,Student learns: Math=%0d, Physics=%0d, Lab=%0d",$time,
             c_if.classroom_math, c_if.classroom_physics, c_if.classroom_lab);
  end
endmodule

module testbench;
  college_if c_if();

  teacher_module   T1 (c_if);
  principal_module P1 (c_if);
  student_module   S1 (c_if);

  initial begin
    //$dumpfile("college_if_tb.vcd");
    //$dumpvars(0, testbench);
    #30;
    $finish;
  end
endmodule
