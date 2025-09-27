module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

  parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4; 
  logic [2:0] state, next_state; 

  always_comb begin
    case (state)
      S0: next_state = din? S1: S0; 
      S1: next_state = din? S1: S2; 
      S2: next_state = din? S3: S0; 
      S3: next_state = din? S1: S4; 
      S4: next_state = din? S3: S0; 
    endcase
  end

  always @(posedge clk) begin
    if (!resetn) begin
      state <= S0; 
    end else begin
      state <= next_state; 
    end
  end


  assign dout = (state == S4); 


endmodule

//Soulution on Internet
module model (
  input clk,
  input resetn,
  input din,
  output logic dout
);

    parameter S0 = 0, S1 = 1, S10 = 2, S101 = 3, S1010 = 4;
    logic [2:0] state;

    always @ (posedge clk) begin
        if (!resetn) begin
            state <= S0;
        end else begin
            case (state)
                S0  : state <= (din ? S1 : S0);
                S1  : state <= (din ? S1 : S10);
                S10 : state <= (din ? S101 : S0);
                S101 : state <= (din ? S1 : S1010);
                S1010 : state <= (din ? S101 : S0);
            endcase
        end
    end

    assign dout = (state == S1010 ? 1 : 0);

endmodule