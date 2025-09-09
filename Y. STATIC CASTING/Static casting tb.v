module top;
  int a;//int is a signed datatype
  byte unsigned b;//byte is signed and converting to unsigned
  initial begin
    a=-12;
    b=a;//implicit convertion//only for simple codes
    $display("b=%0d",b);
    b=byte'(a);//explicit convertion complex codes used when u want to convert into wanted datatype
    $display("b=%0d",b);
  end
endmodule
//not having class and object so we start with module not class
//we won't use $cast
//convertion of one datatype to another datatype
