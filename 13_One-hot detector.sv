module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);
  int i; 
  logic [DATA_WIDTH-1:0] temp; 

  always_comb begin
    temp = '0; 
    for (i= 0; i< DATA_WIDTH; i++) begin
      if (din[i]) begin
        temp++; 
      end
    end
  end

  assign onehot = (temp == 1); 


endmodule