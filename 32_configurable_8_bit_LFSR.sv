module model (
    input clk,
    input resetn,
    input [7:0] din,
    input [7:0] tap,
    output [7:0] dout
);

    logic new_bit; 
    logic [7:0] tap_ff; 
    logic [7:0] temp; 

    always @(posedge clk) begin
        if (!resetn) begin
            temp <= din; 
            tap_ff <= tap; 
        end
        else begin
            temp <= {temp[6:0], new_bit}; 
            tap_ff <= tap; 
        end
    end

    assign new_bit = ^(temp & tap_ff); 
    assign dout = temp; 

endmodule