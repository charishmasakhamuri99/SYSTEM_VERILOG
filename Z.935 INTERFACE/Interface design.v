//college is an interface
//classrooms signals/tasks
interface college_if;
  logic [7:0] classroom_math;
  logic [7:0] classroom_physics;
  logic [7:0] classroom_lab;

 
  modport teacher (output classroom_math, output classroom_physics, output classroom_lab);

 
  modport student (input classroom_math, input classroom_physics, input classroom_lab);

  
  modport principal (input classroom_math, input classroom_physics, output classroom_lab);
endinterface
