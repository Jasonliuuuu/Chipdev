module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);

  logic [$clog2(DATA_WIDTH):0] temp; 
  int i; 

  always @(*) begin
    temp = 0; 
    for (i = 0; i <DATA_WIDTH; i++) begin
      temp = temp + din[i]; 
    end
  end

  assign dout = temp; 


endmodule