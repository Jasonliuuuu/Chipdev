// The following sollution is wrong.
module model (
    input logic clk,
    input logic resetn,
    input logic din,
    input logic cen,
    output logic doutx,
    output logic douty 
);

    parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3, S4 = 4; 
    logic [2:0] state, next_state; 
    logic din_ff, cen_ff; 

    always @(posedge clk) begin
        if(!resetn) begin
            state <= 0; 
            din_ff <= 0; 
            cen_ff <= 0; 
        end
        else begin
            state <= next_state; 
            din_ff <= din; 
            cen_ff <= cen; 
        end
    end

    always @(*) begin
        case (state)
            S0: next_state = din_ff? S1: S4; 
            S1: next_state = din_ff? S2: S3; 
            S2: next_state = din_ff? S2: S3; 
            S3: next_state = din_ff? S1: S4; 
            S4: next_state = din_ff? S1: S4; 
            default: next_state = S0; 
        endcase
    end

    //Gated by registered cen_ff
    always_comb begin 
        if (cen_ff) begin
            doutx = (state == S2 && din_ff == 0) || (state == S4 && din_ff == 1); 
            douty = (state == S2 && din_ff == 1) ?? (state == S4 && din_ff == 0); 
        end
        else begin
            doutx = 1'b0; 
            douty = 1'b0; 
        end
    end


    

endmodule