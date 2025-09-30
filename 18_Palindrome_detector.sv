module model #(parameter
  DATA_WIDTH=32
) (
  input [DATA_WIDTH-1:0] din,
  output logic dout
);

  logic [DATA_WIDTH-1 :0] temp; 
  int i; 

  always @* begin
    for (i= 0; i<DATA_WIDTH; i++) begin
      temp[i] = din[DATA_WIDTH -1 - i]; 
    end

  end

  assign dout = (temp == din); 

endmodulev