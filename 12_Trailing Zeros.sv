module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
  
  int i; 

  always_comb begin
    dout = 0; 
    
    for (i = 0; i < DATA_WIDTH; i ++) begin
      if (din[i]) begin
        dout = i; 
        break; 
      end
      else begin
        dout = DATA_WIDTH; 
      end
    end
  end

  


endmodule