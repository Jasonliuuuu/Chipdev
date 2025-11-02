module model #(parameter
  DATA_WIDTH = 16,
  MAX = 99
) (
    input clk,
    input reset, start, stop,
    output logic [DATA_WIDTH-1:0] count
);

  logic [DATA_WIDTH-1 :0] temp; 
  logic running; 

  always @(posedge clk) begin
    if (reset) begin
      temp <= 0; 
      running <= 0; 
    end
    else if (stop) begin
      temp <= temp; 
      running <= 0; 
    end
    else if (start || running) begin
      running <= 1; 
      temp <= (temp == MAX) ? 0: temp + 1; 
    end
  end 

  assign count = temp; 


  

endmodule