module pllclock(input clk_50mhz,
							rst_50mhz,
					output clk_50hz	
						
);

reg [31:0] count_reg = 0;
reg out_100hz = 0;
assign clk_50hz=out_100hz;
always @(posedge clk_50mhz or posedge rst_50mhz) begin
    if (rst_50mhz) begin
        count_reg <= 0;
        out_100hz <= 0;
    end else begin
        if (count_reg < 1250) begin
            count_reg <= count_reg + 1;
        end else begin
            count_reg <= 0;
            out_100hz <= ~out_100hz;
        end
    end
end
endmodule