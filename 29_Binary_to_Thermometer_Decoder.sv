module model (
    input [7:0] din,
    output reg [255:0] dout
);

    assign dout = ~( {256{1'b1}} << (din + 1) ); 

endmodule