module model (
  input clk,
  input resetn,
  input [4:0] init,
  input din,
  output logic seen
);

  logic [4:0] cur, len, target; 
  logic reset_seen; 


  always @(posedge clk) begin
    if (!resetn) begin
      reset_seen <= 1; 
      cur <= 0; 
      len <= 0; 
    end
    else begin
      cur <= {cur[3:0], din}; 
      len <= (len < 5)? len +1: len; 
    end
  end

  assign target = (resetn && reset_seen && len ==0) ? init : target; 
  //resetn should be 1, reset_seen should be 1, and the len should be 0
  //THE target is the sequence that we need to detect
  assign seen = reset_seen && (cur == target) && (len == 5); 



endmodule