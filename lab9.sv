/*---------------------------------------------------------------------------
  --      lab9.sv                                                          --
  --      Christine Chen                                                   --
  --      10/23/2013                                                       --
  --                                                                       --
  --      For use with ECE 298 Experiment 9                                --
  --      UIUC ECE Department                                              --
  ---------------------------------------------------------------------------*/
// Top-level module that integrates the Nios II system with the rest of the hardware

module lab9(  	  input			CLOCK_50, 
				  input  [3:0]  KEY,
			  output [7:0]  LEDG,
				  output [17:0] LEDR,
				  output [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
				  
				  output [12:0] sdram_wire_addr,
				  output  [1:0] sdram_wire_ba,
				  output        sdram_wire_cas_n,
				  output		sdram_wire_cke,
				  output		sdram_wire_cs_n,
				  inout  [31:0] sdram_wire_dq,
				  output  [3:0] sdram_wire_dqm,
				  output		sdram_wire_ras_n,
				  output		sdram_wire_we_n,
				  output		sdram_wire_clk,
				  output		          		ADC_CLK_A,
					output		          		ADC_CLK_B,
					input		    [13:0]		ADC_DA,
					input		    [13:0]		ADC_DB,
					output		          		ADC_OEB_A,
					output		          		ADC_OEB_B,
					input		          		ADC_OTR_A,
					input		          		ADC_OTR_B,
					input		          		OSC_SMA_ADC4,
					input		          		SMA_DAC4,
					output						ADC_1,
					output						ADC_2
				  
				  );
				assign  ADC_OEB_A = 0; 		  	  //ADC_OEA
				assign  ADC_OEB_B = 0 ;			  //ADC_OEB
				assign  ADC_CLK_B = CLK_100;  	  //PLL Clock to ADC_B
				assign  ADC_CLK_A = CLK_100;  
				  wire CLK_100;
				  logic  [1:0] to_sw_sig;		// handshake
				  logic  [1:0] to_hw_sig;
				  logic  [7:0] to_sw_port;		// data
				  logic  [7:0] to_hw_port;
				  wire clk_20;
				  
//				  logic  [127:0] msg_en;
//				  logic  [127:0] aes_key;
//				  logic  [127:0] msg_de;
//				  logic 		 io_ready;
//				  logic			 aes_ready;
//				  logic  [1407:0] KeySchedule;
//				  
//				  // For debugging purpose
//			  assign LEDR[7:0] = {to_hw_port[7:0]};
//			  assign LEDG[3:0] = {to_sw_sig, to_hw_sig};

				TENBASET_TxD test1(.clk20(clk_20),.Ethernet_TDp(ADC_1), .Ethernet_TDm(ADC_2));
				  
			  nios_system NiosII (.clk_clk(CLOCK_50), 
											.clk_20mhz_clk(clk_20),
											 .reset_reset_n(KEY[0]), 
											 .to_sw_sig_export(2'b01&CLK_100), 
											 .to_hw_sig_export(to_hw_sig),
											 .to_sw_port_export(ADC_DB),
											 .to_hw_port_export(to_hw_port),
											 .sdram_wire_addr(sdram_wire_addr),     //  sdram_wire.addr
											 .sdram_wire_ba(sdram_wire_ba),      	//            .ba
											 .sdram_wire_cas_n(sdram_wire_cas_n),   //            .cas_n
											 .sdram_wire_cke(sdram_wire_cke),     	//            .cke
											 .sdram_wire_cs_n(sdram_wire_cs_n),     //            .cs_n
											 .sdram_wire_dq(sdram_wire_dq),      	//            .dq
											 .sdram_wire_dqm(sdram_wire_dqm),     	//            .dqm
											 .sdram_wire_ras_n(sdram_wire_ras_n),   //            .ras_n
											 .sdram_wire_we_n(sdram_wire_we_n),     //            .we_n
											 .sdram_clk_clk(sdram_wire_clk)
											 );
				pll  pll_100   (
											 .inclk0(CLOCK_50),
												  .pllena(v),
												  .areset(g),
												  .c0    (CLK_125),
												  .c1	(CLK_65)
			   );			
				pllclock(.clk_50mhz(CLOCK_50),
							.rst_50mhz(1'b0),
					.clk_50hz(CLK_100)
						
);
//											 
//			  io_module io_module0 (.clk(CLOCK_50),             
//										.reset_n(KEY[1]),
//										.to_sw_sig(to_sw_sig),
//										.to_sw_port(to_sw_port),
//										.to_hw_sig(to_hw_sig),
//										.to_hw_port(to_hw_port),
//										.msg_en(msg_en),
//										.key(aes_key),
//										.msg_de(msg_de),
//										.io_ready(io_ready),
//										.aes_ready(aes_ready)
//					); 
//
//					
//					aes_controller aes_controller0 (.clk(CLOCK_50),
//													.reset_n(KEY[1]),
//													//.key1(KEY[2]),
//													.msg_en(msg_en),
//													.key(aes_key),
//													.msg_de(msg_de),
//													.io_ready(io_ready),
//													.aes_ready(aes_ready)
//					);
//					

					 
														 
					// Displays the first 4 and the last 4 digits of the received message
//					HexDriver        Hex0 (.In0(msg_de[3:0]),
//											     .Out0(HEX0) );
//					HexDriver        Hex1 (.In0(msg_de[7:4]),
//											     .Out0(HEX1) );
//					HexDriver        Hex2 (.In0(msg_de[11:8]),
//											     .Out0(HEX2) );
//					HexDriver        Hex3 (.In0(msg_de[15:12]),
//											     .Out0(HEX3) );
//					HexDriver        Hex4 (.In0(msg_de[115:112]),
//											     .Out0(HEX4) );
//					HexDriver        Hex5 (.In0(msg_de[119:116]),
//											     .Out0(HEX5) );
//					HexDriver        Hex6 (.In0(msg_de[123:120]),
//											     .Out0(HEX6) );
//					HexDriver        Hex7 (.In0(msg_de[127:124]),
//											     .Out0(HEX7) );							  
endmodule
