module model (
    input [7:0] din,
    input [2:0] addr,
    input wr,
    input rd,
    input clk,
    input resetn,
    output logic [7:0] dout,
    output logic error
);
    logic [7:0] mem [7:0]; 
    logic [7:0] dout_reg; 
    logic error_reg; 

    always @(posedge clk) begin
        if (!resetn) begin
            mem[0] <= 0; 
            mem[1] <= 0; 
            mem[2] <= 0; 
            mem[3] <= 0; 
            mem[4] <= 0; 
            mem[5] <= 0; 
            mem[6] <= 0; 
            mem[7] <= 0; 
            dout_reg <= 0; 
            error_reg <= 0; 
        end
        else if (rd && wr) begin
            error_reg <= 1; 
            dout_reg <= 0;
        end
        else if (wr) begin
            error_reg <= 0; 
            mem[addr] <= din; 
            dout_reg <= 0; 
        end
        else if (rd) begin
            error_reg <= 0; 
            dout_reg <= mem[addr]; 
        end
        else begin
            error_reg <= 0; 
            dout_reg <= 0; 
        end
    end

    assign dout = dout_reg; 
    assign error = error_reg; 


endmodule