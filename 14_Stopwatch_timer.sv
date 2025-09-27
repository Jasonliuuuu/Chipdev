// Assume the start won't be pressed twice in a row
module model #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);

  logic [DATA_WIDTH-1:0] temp; 
  logic signal; 

  always @(posedge clk) begin
    if (reset) begin
      temp <= '0; 
      signal <= '0; 
    end else if (stop) begin
      temp <= temp; 
      signal <= '0; 
    end else if (start || signal) begin // here siganl should be 0
      signal <= 1; 
      temp <= (temp == MAX) ? '0: temp + 1 ; 
    end
  end

  assign count = temp; 

endmodule