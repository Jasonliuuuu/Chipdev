module model #(parameter
  DATA_WIDTH=32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

  int i; 
  logic [DATA_WIDTH -1 : 0] reversed; 
  
  always @* begin 
    for (i = 0; i < DATA_WIDTH; i++) begin
      reversed[i] = din[DATA_WIDTH -1 -i]; 
    end
  end
  
  assign dout = reversed; 

  

endmodule