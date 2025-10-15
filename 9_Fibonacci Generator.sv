module model #(parameter
  DATA_WIDTH=32
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

  logic [DATA_WIDTH:1] pre_val, cur_val; 

  always @(posedge clk) begin
    if (!resetn) begin
      cur_val <= 1; 
      pre_val <= 0
    end
    else begin
      cur_val <= cur_val + pre_val; 
      pre_val <= cur_val; 
    end
  end
    
  assign out = cur_val; 

endmodule