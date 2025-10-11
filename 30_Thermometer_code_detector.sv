module model #(parameter
    DATA_WIDTH = 8
) (
    input [DATA_WIDTH-1:0] codeIn,
    output reg isThermometer
);

    logic [$clog2(DATA_WIDTH) -1 : 0] n_toggle; 

    int i; 
    always_comb begin
        n_toggle = 0; 
        for (i = 1; i < DATA_WIDTH ; i ++) begin
            n_toggle = n_toggle + (codeIn[i - 1] ^ codeIn[i]); 
        end
    end

    assign isThermometer = (n_toggle == 1); 

endmodule