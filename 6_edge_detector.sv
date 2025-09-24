module model (
  input clk,
  input resetn,
  input din,
  output dout
);

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3; 
  logic [1:0] state; 

  always @(posedge clk) begin
    if (!resetn) begin
      state <= S0; 
    end
    else begin
      case (state)
        S0 : state <= (din? S1: S0); 
        S1 : state <= (din? S3: S2); 
        S2 : state <= (din? S1: S0); 
        S3 : state <= (din? S3: S2); 
      endcase
    end
  end

  assign dout = (state == S1); 


endmodule