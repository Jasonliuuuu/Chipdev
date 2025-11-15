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
    logic [7:0] dout_temp;
    logic error_temp;  



    always @(posedge clk) begin
        if(!resetn) begin
            mem[0] <= 0; 
            mem[1] <= 0; 
            mem[2] <= 0; 
            mem[3] <= 0; 
            mem[4] <= 0; 
            mem[5] <= 0; 
            mem[6] <= 0; 
            mem[7] <= 0; 
            error_temp <= 0;
            dout_temp <= 0; 
        end
        else if (rd ==1 && wr == 1 ) begin
            error_temp <= 1; 
            dout_temp <= 0; 
        end
        else if (rd ==0 && wr ==0 ) begin
            error_temp <= 0; 
            dout_temp <= 0; 
        end 
        else if (wr) begin
            mem[addr] <= din; 
            error_temp <=0; 
            dout_temp <=0; 
        end
        else if (rd) begin
            dout_temp <= mem[addr]; 
            error_temp <= 0; 
        end
    end

    assign dout = dout_temp; 
    assign error = error_temp; 


endmodule