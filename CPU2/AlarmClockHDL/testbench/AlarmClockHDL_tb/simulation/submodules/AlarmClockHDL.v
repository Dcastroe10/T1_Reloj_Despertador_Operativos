// AlarmClockHDL.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module AlarmClockHDL (
		input  wire       alarm1_export,   //   alarm1.export
		input  wire       button1_export,  //  button1.export
		input  wire       button2_export,  //  button2.export
		input  wire       button3_export,  //  button3.export
		input  wire       button4_export,  //  button4.export
		output wire [1:0] buzzer_export,   //   buzzer.export
		input  wire       clk_clk,         //      clk.clk
		output wire [6:0] segment1_export, // segment1.export
		output wire [6:0] segment2_export, // segment2.export
		output wire [6:0] segment3_export, // segment3.export
		output wire [6:0] segment4_export  // segment4.export
	);

	wire         niosii_debug_reset_request_reset;                     // NIOSII:debug_reset_request -> rst_controller:reset_in0
	wire  [31:0] niosii_data_master_readdata;                          // mm_interconnect_0:NIOSII_data_master_readdata -> NIOSII:d_readdata
	wire         niosii_data_master_waitrequest;                       // mm_interconnect_0:NIOSII_data_master_waitrequest -> NIOSII:d_waitrequest
	wire         niosii_data_master_debugaccess;                       // NIOSII:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:NIOSII_data_master_debugaccess
	wire  [13:0] niosii_data_master_address;                           // NIOSII:d_address -> mm_interconnect_0:NIOSII_data_master_address
	wire   [3:0] niosii_data_master_byteenable;                        // NIOSII:d_byteenable -> mm_interconnect_0:NIOSII_data_master_byteenable
	wire         niosii_data_master_read;                              // NIOSII:d_read -> mm_interconnect_0:NIOSII_data_master_read
	wire         niosii_data_master_write;                             // NIOSII:d_write -> mm_interconnect_0:NIOSII_data_master_write
	wire  [31:0] niosii_data_master_writedata;                         // NIOSII:d_writedata -> mm_interconnect_0:NIOSII_data_master_writedata
	wire  [31:0] niosii_instruction_master_readdata;                   // mm_interconnect_0:NIOSII_instruction_master_readdata -> NIOSII:i_readdata
	wire         niosii_instruction_master_waitrequest;                // mm_interconnect_0:NIOSII_instruction_master_waitrequest -> NIOSII:i_waitrequest
	wire  [13:0] niosii_instruction_master_address;                    // NIOSII:i_address -> mm_interconnect_0:NIOSII_instruction_master_address
	wire         niosii_instruction_master_read;                       // NIOSII:i_read -> mm_interconnect_0:NIOSII_instruction_master_read
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_chipselect;  // mm_interconnect_0:JTAG_avalon_jtag_slave_chipselect -> JTAG:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_avalon_jtag_slave_readdata;    // JTAG:av_readdata -> mm_interconnect_0:JTAG_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_waitrequest; // JTAG:av_waitrequest -> mm_interconnect_0:JTAG_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_avalon_jtag_slave_address;     // mm_interconnect_0:JTAG_avalon_jtag_slave_address -> JTAG:av_address
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_read;        // mm_interconnect_0:JTAG_avalon_jtag_slave_read -> JTAG:av_read_n
	wire         mm_interconnect_0_jtag_avalon_jtag_slave_write;       // mm_interconnect_0:JTAG_avalon_jtag_slave_write -> JTAG:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_avalon_jtag_slave_writedata;   // mm_interconnect_0:JTAG_avalon_jtag_slave_writedata -> JTAG:av_writedata
	wire  [31:0] mm_interconnect_0_niosii_debug_mem_slave_readdata;    // NIOSII:debug_mem_slave_readdata -> mm_interconnect_0:NIOSII_debug_mem_slave_readdata
	wire         mm_interconnect_0_niosii_debug_mem_slave_waitrequest; // NIOSII:debug_mem_slave_waitrequest -> mm_interconnect_0:NIOSII_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_niosii_debug_mem_slave_debugaccess; // mm_interconnect_0:NIOSII_debug_mem_slave_debugaccess -> NIOSII:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_niosii_debug_mem_slave_address;     // mm_interconnect_0:NIOSII_debug_mem_slave_address -> NIOSII:debug_mem_slave_address
	wire         mm_interconnect_0_niosii_debug_mem_slave_read;        // mm_interconnect_0:NIOSII_debug_mem_slave_read -> NIOSII:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_niosii_debug_mem_slave_byteenable;  // mm_interconnect_0:NIOSII_debug_mem_slave_byteenable -> NIOSII:debug_mem_slave_byteenable
	wire         mm_interconnect_0_niosii_debug_mem_slave_write;       // mm_interconnect_0:NIOSII_debug_mem_slave_write -> NIOSII:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_niosii_debug_mem_slave_writedata;   // mm_interconnect_0:NIOSII_debug_mem_slave_writedata -> NIOSII:debug_mem_slave_writedata
	wire         mm_interconnect_0_timer_s1_chipselect;                // mm_interconnect_0:TIMER_s1_chipselect -> TIMER:chipselect
	wire  [15:0] mm_interconnect_0_timer_s1_readdata;                  // TIMER:readdata -> mm_interconnect_0:TIMER_s1_readdata
	wire   [2:0] mm_interconnect_0_timer_s1_address;                   // mm_interconnect_0:TIMER_s1_address -> TIMER:address
	wire         mm_interconnect_0_timer_s1_write;                     // mm_interconnect_0:TIMER_s1_write -> TIMER:write_n
	wire  [15:0] mm_interconnect_0_timer_s1_writedata;                 // mm_interconnect_0:TIMER_s1_writedata -> TIMER:writedata
	wire         mm_interconnect_0_onchipram_s1_chipselect;            // mm_interconnect_0:ONCHIPRAM_s1_chipselect -> ONCHIPRAM:chipselect
	wire  [31:0] mm_interconnect_0_onchipram_s1_readdata;              // ONCHIPRAM:readdata -> mm_interconnect_0:ONCHIPRAM_s1_readdata
	wire   [9:0] mm_interconnect_0_onchipram_s1_address;               // mm_interconnect_0:ONCHIPRAM_s1_address -> ONCHIPRAM:address
	wire   [3:0] mm_interconnect_0_onchipram_s1_byteenable;            // mm_interconnect_0:ONCHIPRAM_s1_byteenable -> ONCHIPRAM:byteenable
	wire         mm_interconnect_0_onchipram_s1_write;                 // mm_interconnect_0:ONCHIPRAM_s1_write -> ONCHIPRAM:write
	wire  [31:0] mm_interconnect_0_onchipram_s1_writedata;             // mm_interconnect_0:ONCHIPRAM_s1_writedata -> ONCHIPRAM:writedata
	wire         mm_interconnect_0_onchipram_s1_clken;                 // mm_interconnect_0:ONCHIPRAM_s1_clken -> ONCHIPRAM:clken
	wire         mm_interconnect_0_segment1_s1_chipselect;             // mm_interconnect_0:SEGMENT1_s1_chipselect -> SEGMENT1:chipselect
	wire  [31:0] mm_interconnect_0_segment1_s1_readdata;               // SEGMENT1:readdata -> mm_interconnect_0:SEGMENT1_s1_readdata
	wire   [1:0] mm_interconnect_0_segment1_s1_address;                // mm_interconnect_0:SEGMENT1_s1_address -> SEGMENT1:address
	wire         mm_interconnect_0_segment1_s1_write;                  // mm_interconnect_0:SEGMENT1_s1_write -> SEGMENT1:write_n
	wire  [31:0] mm_interconnect_0_segment1_s1_writedata;              // mm_interconnect_0:SEGMENT1_s1_writedata -> SEGMENT1:writedata
	wire         mm_interconnect_0_segment4_s1_chipselect;             // mm_interconnect_0:SEGMENT4_s1_chipselect -> SEGMENT4:chipselect
	wire  [31:0] mm_interconnect_0_segment4_s1_readdata;               // SEGMENT4:readdata -> mm_interconnect_0:SEGMENT4_s1_readdata
	wire   [1:0] mm_interconnect_0_segment4_s1_address;                // mm_interconnect_0:SEGMENT4_s1_address -> SEGMENT4:address
	wire         mm_interconnect_0_segment4_s1_write;                  // mm_interconnect_0:SEGMENT4_s1_write -> SEGMENT4:write_n
	wire  [31:0] mm_interconnect_0_segment4_s1_writedata;              // mm_interconnect_0:SEGMENT4_s1_writedata -> SEGMENT4:writedata
	wire         mm_interconnect_0_segment3_s1_chipselect;             // mm_interconnect_0:SEGMENT3_s1_chipselect -> SEGMENT3:chipselect
	wire  [31:0] mm_interconnect_0_segment3_s1_readdata;               // SEGMENT3:readdata -> mm_interconnect_0:SEGMENT3_s1_readdata
	wire   [1:0] mm_interconnect_0_segment3_s1_address;                // mm_interconnect_0:SEGMENT3_s1_address -> SEGMENT3:address
	wire         mm_interconnect_0_segment3_s1_write;                  // mm_interconnect_0:SEGMENT3_s1_write -> SEGMENT3:write_n
	wire  [31:0] mm_interconnect_0_segment3_s1_writedata;              // mm_interconnect_0:SEGMENT3_s1_writedata -> SEGMENT3:writedata
	wire         mm_interconnect_0_segment2_s1_chipselect;             // mm_interconnect_0:SEGMENT2_s1_chipselect -> SEGMENT2:chipselect
	wire  [31:0] mm_interconnect_0_segment2_s1_readdata;               // SEGMENT2:readdata -> mm_interconnect_0:SEGMENT2_s1_readdata
	wire   [1:0] mm_interconnect_0_segment2_s1_address;                // mm_interconnect_0:SEGMENT2_s1_address -> SEGMENT2:address
	wire         mm_interconnect_0_segment2_s1_write;                  // mm_interconnect_0:SEGMENT2_s1_write -> SEGMENT2:write_n
	wire  [31:0] mm_interconnect_0_segment2_s1_writedata;              // mm_interconnect_0:SEGMENT2_s1_writedata -> SEGMENT2:writedata
	wire         mm_interconnect_0_buzz_s1_chipselect;                 // mm_interconnect_0:BUZZ_s1_chipselect -> BUZZ:chipselect
	wire  [31:0] mm_interconnect_0_buzz_s1_readdata;                   // BUZZ:readdata -> mm_interconnect_0:BUZZ_s1_readdata
	wire   [1:0] mm_interconnect_0_buzz_s1_address;                    // mm_interconnect_0:BUZZ_s1_address -> BUZZ:address
	wire         mm_interconnect_0_buzz_s1_write;                      // mm_interconnect_0:BUZZ_s1_write -> BUZZ:write_n
	wire  [31:0] mm_interconnect_0_buzz_s1_writedata;                  // mm_interconnect_0:BUZZ_s1_writedata -> BUZZ:writedata
	wire  [31:0] mm_interconnect_0_alarm1_s1_readdata;                 // ALARM1:readdata -> mm_interconnect_0:ALARM1_s1_readdata
	wire   [1:0] mm_interconnect_0_alarm1_s1_address;                  // mm_interconnect_0:ALARM1_s1_address -> ALARM1:address
	wire  [31:0] mm_interconnect_0_button4_s1_readdata;                // BUTTON4:readdata -> mm_interconnect_0:BUTTON4_s1_readdata
	wire   [1:0] mm_interconnect_0_button4_s1_address;                 // mm_interconnect_0:BUTTON4_s1_address -> BUTTON4:address
	wire  [31:0] mm_interconnect_0_button3_s1_readdata;                // BUTTON3:readdata -> mm_interconnect_0:BUTTON3_s1_readdata
	wire   [1:0] mm_interconnect_0_button3_s1_address;                 // mm_interconnect_0:BUTTON3_s1_address -> BUTTON3:address
	wire  [31:0] mm_interconnect_0_button2_s1_readdata;                // BUTTON2:readdata -> mm_interconnect_0:BUTTON2_s1_readdata
	wire   [1:0] mm_interconnect_0_button2_s1_address;                 // mm_interconnect_0:BUTTON2_s1_address -> BUTTON2:address
	wire  [31:0] mm_interconnect_0_button1_s1_readdata;                // BUTTON1:readdata -> mm_interconnect_0:BUTTON1_s1_readdata
	wire   [1:0] mm_interconnect_0_button1_s1_address;                 // mm_interconnect_0:BUTTON1_s1_address -> BUTTON1:address
	wire         irq_mapper_receiver0_irq;                             // JTAG:av_irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                             // TIMER:irq -> irq_mapper:receiver1_irq
	wire  [31:0] niosii_irq_irq;                                       // irq_mapper:sender_irq -> NIOSII:irq
	wire         rst_controller_reset_out_reset;                       // rst_controller:reset_out -> [ALARM1:reset_n, BUTTON1:reset_n, BUTTON2:reset_n, BUTTON3:reset_n, BUTTON4:reset_n, BUZZ:reset_n, JTAG:rst_n, NIOSII:reset_n, ONCHIPRAM:reset, SEGMENT1:reset_n, SEGMENT2:reset_n, SEGMENT3:reset_n, SEGMENT4:reset_n, TIMER:reset_n, irq_mapper:reset, mm_interconnect_0:NIOSII_reset_reset_bridge_in_reset_reset, rst_translator:in_reset]
	wire         rst_controller_reset_out_reset_req;                   // rst_controller:reset_req -> [NIOSII:reset_req, ONCHIPRAM:reset_req, rst_translator:reset_req_in]

	AlarmClockHDL_ALARM1 alarm1 (
		.clk      (clk_clk),                              //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address  (mm_interconnect_0_alarm1_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_alarm1_s1_readdata), //                    .readdata
		.in_port  (alarm1_export)                         // external_connection.export
	);

	AlarmClockHDL_ALARM1 button1 (
		.clk      (clk_clk),                               //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),       //               reset.reset_n
		.address  (mm_interconnect_0_button1_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_button1_s1_readdata), //                    .readdata
		.in_port  (button1_export)                         // external_connection.export
	);

	AlarmClockHDL_ALARM1 button2 (
		.clk      (clk_clk),                               //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),       //               reset.reset_n
		.address  (mm_interconnect_0_button2_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_button2_s1_readdata), //                    .readdata
		.in_port  (button2_export)                         // external_connection.export
	);

	AlarmClockHDL_ALARM1 button3 (
		.clk      (clk_clk),                               //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),       //               reset.reset_n
		.address  (mm_interconnect_0_button3_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_button3_s1_readdata), //                    .readdata
		.in_port  (button3_export)                         // external_connection.export
	);

	AlarmClockHDL_ALARM1 button4 (
		.clk      (clk_clk),                               //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),       //               reset.reset_n
		.address  (mm_interconnect_0_button4_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_button4_s1_readdata), //                    .readdata
		.in_port  (button4_export)                         // external_connection.export
	);

	AlarmClockHDL_BUZZ buzz (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_buzz_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_buzz_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_buzz_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_buzz_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_buzz_s1_readdata),   //                    .readdata
		.out_port   (buzzer_export)                         // external_connection.export
	);

	AlarmClockHDL_JTAG jtag (
		.clk            (clk_clk),                                              //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                      //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                              //               irq.irq
	);

	AlarmClockHDL_NIOSII niosii (
		.clk                                 (clk_clk),                                              //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                      //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                   //                          .reset_req
		.d_address                           (niosii_data_master_address),                           //               data_master.address
		.d_byteenable                        (niosii_data_master_byteenable),                        //                          .byteenable
		.d_read                              (niosii_data_master_read),                              //                          .read
		.d_readdata                          (niosii_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (niosii_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (niosii_data_master_write),                             //                          .write
		.d_writedata                         (niosii_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (niosii_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (niosii_instruction_master_address),                    //        instruction_master.address
		.i_read                              (niosii_instruction_master_read),                       //                          .read
		.i_readdata                          (niosii_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (niosii_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (niosii_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (niosii_debug_reset_request_reset),                     //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_niosii_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_niosii_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_niosii_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_niosii_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_niosii_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_niosii_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_niosii_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_niosii_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                      // custom_instruction_master.readra
	);

	AlarmClockHDL_ONCHIPRAM onchipram (
		.clk        (clk_clk),                                   //   clk1.clk
		.address    (mm_interconnect_0_onchipram_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchipram_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchipram_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchipram_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchipram_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchipram_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchipram_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),            // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req),        //       .reset_req
		.freeze     (1'b0)                                       // (terminated)
	);

	AlarmClockHDL_SEGMENT1 segment1 (
		.clk        (clk_clk),                                  //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),          //               reset.reset_n
		.address    (mm_interconnect_0_segment1_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_segment1_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_segment1_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_segment1_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_segment1_s1_readdata),   //                    .readdata
		.out_port   (segment1_export)                           // external_connection.export
	);

	AlarmClockHDL_SEGMENT1 segment2 (
		.clk        (clk_clk),                                  //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),          //               reset.reset_n
		.address    (mm_interconnect_0_segment2_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_segment2_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_segment2_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_segment2_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_segment2_s1_readdata),   //                    .readdata
		.out_port   (segment2_export)                           // external_connection.export
	);

	AlarmClockHDL_SEGMENT1 segment3 (
		.clk        (clk_clk),                                  //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),          //               reset.reset_n
		.address    (mm_interconnect_0_segment3_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_segment3_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_segment3_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_segment3_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_segment3_s1_readdata),   //                    .readdata
		.out_port   (segment3_export)                           // external_connection.export
	);

	AlarmClockHDL_SEGMENT1 segment4 (
		.clk        (clk_clk),                                  //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),          //               reset.reset_n
		.address    (mm_interconnect_0_segment4_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_segment4_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_segment4_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_segment4_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_segment4_s1_readdata),   //                    .readdata
		.out_port   (segment4_export)                           // external_connection.export
	);

	AlarmClockHDL_TIMER timer (
		.clk        (clk_clk),                               //   clk.clk
		.reset_n    (~rst_controller_reset_out_reset),       // reset.reset_n
		.address    (mm_interconnect_0_timer_s1_address),    //    s1.address
		.writedata  (mm_interconnect_0_timer_s1_writedata),  //      .writedata
		.readdata   (mm_interconnect_0_timer_s1_readdata),   //      .readdata
		.chipselect (mm_interconnect_0_timer_s1_chipselect), //      .chipselect
		.write_n    (~mm_interconnect_0_timer_s1_write),     //      .write_n
		.irq        (irq_mapper_receiver1_irq)               //   irq.irq
	);

	AlarmClockHDL_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                            (clk_clk),                                              //                          clk_0_clk.clk
		.NIOSII_reset_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                       // NIOSII_reset_reset_bridge_in_reset.reset
		.NIOSII_data_master_address               (niosii_data_master_address),                           //                 NIOSII_data_master.address
		.NIOSII_data_master_waitrequest           (niosii_data_master_waitrequest),                       //                                   .waitrequest
		.NIOSII_data_master_byteenable            (niosii_data_master_byteenable),                        //                                   .byteenable
		.NIOSII_data_master_read                  (niosii_data_master_read),                              //                                   .read
		.NIOSII_data_master_readdata              (niosii_data_master_readdata),                          //                                   .readdata
		.NIOSII_data_master_write                 (niosii_data_master_write),                             //                                   .write
		.NIOSII_data_master_writedata             (niosii_data_master_writedata),                         //                                   .writedata
		.NIOSII_data_master_debugaccess           (niosii_data_master_debugaccess),                       //                                   .debugaccess
		.NIOSII_instruction_master_address        (niosii_instruction_master_address),                    //          NIOSII_instruction_master.address
		.NIOSII_instruction_master_waitrequest    (niosii_instruction_master_waitrequest),                //                                   .waitrequest
		.NIOSII_instruction_master_read           (niosii_instruction_master_read),                       //                                   .read
		.NIOSII_instruction_master_readdata       (niosii_instruction_master_readdata),                   //                                   .readdata
		.ALARM1_s1_address                        (mm_interconnect_0_alarm1_s1_address),                  //                          ALARM1_s1.address
		.ALARM1_s1_readdata                       (mm_interconnect_0_alarm1_s1_readdata),                 //                                   .readdata
		.BUTTON1_s1_address                       (mm_interconnect_0_button1_s1_address),                 //                         BUTTON1_s1.address
		.BUTTON1_s1_readdata                      (mm_interconnect_0_button1_s1_readdata),                //                                   .readdata
		.BUTTON2_s1_address                       (mm_interconnect_0_button2_s1_address),                 //                         BUTTON2_s1.address
		.BUTTON2_s1_readdata                      (mm_interconnect_0_button2_s1_readdata),                //                                   .readdata
		.BUTTON3_s1_address                       (mm_interconnect_0_button3_s1_address),                 //                         BUTTON3_s1.address
		.BUTTON3_s1_readdata                      (mm_interconnect_0_button3_s1_readdata),                //                                   .readdata
		.BUTTON4_s1_address                       (mm_interconnect_0_button4_s1_address),                 //                         BUTTON4_s1.address
		.BUTTON4_s1_readdata                      (mm_interconnect_0_button4_s1_readdata),                //                                   .readdata
		.BUZZ_s1_address                          (mm_interconnect_0_buzz_s1_address),                    //                            BUZZ_s1.address
		.BUZZ_s1_write                            (mm_interconnect_0_buzz_s1_write),                      //                                   .write
		.BUZZ_s1_readdata                         (mm_interconnect_0_buzz_s1_readdata),                   //                                   .readdata
		.BUZZ_s1_writedata                        (mm_interconnect_0_buzz_s1_writedata),                  //                                   .writedata
		.BUZZ_s1_chipselect                       (mm_interconnect_0_buzz_s1_chipselect),                 //                                   .chipselect
		.JTAG_avalon_jtag_slave_address           (mm_interconnect_0_jtag_avalon_jtag_slave_address),     //             JTAG_avalon_jtag_slave.address
		.JTAG_avalon_jtag_slave_write             (mm_interconnect_0_jtag_avalon_jtag_slave_write),       //                                   .write
		.JTAG_avalon_jtag_slave_read              (mm_interconnect_0_jtag_avalon_jtag_slave_read),        //                                   .read
		.JTAG_avalon_jtag_slave_readdata          (mm_interconnect_0_jtag_avalon_jtag_slave_readdata),    //                                   .readdata
		.JTAG_avalon_jtag_slave_writedata         (mm_interconnect_0_jtag_avalon_jtag_slave_writedata),   //                                   .writedata
		.JTAG_avalon_jtag_slave_waitrequest       (mm_interconnect_0_jtag_avalon_jtag_slave_waitrequest), //                                   .waitrequest
		.JTAG_avalon_jtag_slave_chipselect        (mm_interconnect_0_jtag_avalon_jtag_slave_chipselect),  //                                   .chipselect
		.NIOSII_debug_mem_slave_address           (mm_interconnect_0_niosii_debug_mem_slave_address),     //             NIOSII_debug_mem_slave.address
		.NIOSII_debug_mem_slave_write             (mm_interconnect_0_niosii_debug_mem_slave_write),       //                                   .write
		.NIOSII_debug_mem_slave_read              (mm_interconnect_0_niosii_debug_mem_slave_read),        //                                   .read
		.NIOSII_debug_mem_slave_readdata          (mm_interconnect_0_niosii_debug_mem_slave_readdata),    //                                   .readdata
		.NIOSII_debug_mem_slave_writedata         (mm_interconnect_0_niosii_debug_mem_slave_writedata),   //                                   .writedata
		.NIOSII_debug_mem_slave_byteenable        (mm_interconnect_0_niosii_debug_mem_slave_byteenable),  //                                   .byteenable
		.NIOSII_debug_mem_slave_waitrequest       (mm_interconnect_0_niosii_debug_mem_slave_waitrequest), //                                   .waitrequest
		.NIOSII_debug_mem_slave_debugaccess       (mm_interconnect_0_niosii_debug_mem_slave_debugaccess), //                                   .debugaccess
		.ONCHIPRAM_s1_address                     (mm_interconnect_0_onchipram_s1_address),               //                       ONCHIPRAM_s1.address
		.ONCHIPRAM_s1_write                       (mm_interconnect_0_onchipram_s1_write),                 //                                   .write
		.ONCHIPRAM_s1_readdata                    (mm_interconnect_0_onchipram_s1_readdata),              //                                   .readdata
		.ONCHIPRAM_s1_writedata                   (mm_interconnect_0_onchipram_s1_writedata),             //                                   .writedata
		.ONCHIPRAM_s1_byteenable                  (mm_interconnect_0_onchipram_s1_byteenable),            //                                   .byteenable
		.ONCHIPRAM_s1_chipselect                  (mm_interconnect_0_onchipram_s1_chipselect),            //                                   .chipselect
		.ONCHIPRAM_s1_clken                       (mm_interconnect_0_onchipram_s1_clken),                 //                                   .clken
		.SEGMENT1_s1_address                      (mm_interconnect_0_segment1_s1_address),                //                        SEGMENT1_s1.address
		.SEGMENT1_s1_write                        (mm_interconnect_0_segment1_s1_write),                  //                                   .write
		.SEGMENT1_s1_readdata                     (mm_interconnect_0_segment1_s1_readdata),               //                                   .readdata
		.SEGMENT1_s1_writedata                    (mm_interconnect_0_segment1_s1_writedata),              //                                   .writedata
		.SEGMENT1_s1_chipselect                   (mm_interconnect_0_segment1_s1_chipselect),             //                                   .chipselect
		.SEGMENT2_s1_address                      (mm_interconnect_0_segment2_s1_address),                //                        SEGMENT2_s1.address
		.SEGMENT2_s1_write                        (mm_interconnect_0_segment2_s1_write),                  //                                   .write
		.SEGMENT2_s1_readdata                     (mm_interconnect_0_segment2_s1_readdata),               //                                   .readdata
		.SEGMENT2_s1_writedata                    (mm_interconnect_0_segment2_s1_writedata),              //                                   .writedata
		.SEGMENT2_s1_chipselect                   (mm_interconnect_0_segment2_s1_chipselect),             //                                   .chipselect
		.SEGMENT3_s1_address                      (mm_interconnect_0_segment3_s1_address),                //                        SEGMENT3_s1.address
		.SEGMENT3_s1_write                        (mm_interconnect_0_segment3_s1_write),                  //                                   .write
		.SEGMENT3_s1_readdata                     (mm_interconnect_0_segment3_s1_readdata),               //                                   .readdata
		.SEGMENT3_s1_writedata                    (mm_interconnect_0_segment3_s1_writedata),              //                                   .writedata
		.SEGMENT3_s1_chipselect                   (mm_interconnect_0_segment3_s1_chipselect),             //                                   .chipselect
		.SEGMENT4_s1_address                      (mm_interconnect_0_segment4_s1_address),                //                        SEGMENT4_s1.address
		.SEGMENT4_s1_write                        (mm_interconnect_0_segment4_s1_write),                  //                                   .write
		.SEGMENT4_s1_readdata                     (mm_interconnect_0_segment4_s1_readdata),               //                                   .readdata
		.SEGMENT4_s1_writedata                    (mm_interconnect_0_segment4_s1_writedata),              //                                   .writedata
		.SEGMENT4_s1_chipselect                   (mm_interconnect_0_segment4_s1_chipselect),             //                                   .chipselect
		.TIMER_s1_address                         (mm_interconnect_0_timer_s1_address),                   //                           TIMER_s1.address
		.TIMER_s1_write                           (mm_interconnect_0_timer_s1_write),                     //                                   .write
		.TIMER_s1_readdata                        (mm_interconnect_0_timer_s1_readdata),                  //                                   .readdata
		.TIMER_s1_writedata                       (mm_interconnect_0_timer_s1_writedata),                 //                                   .writedata
		.TIMER_s1_chipselect                      (mm_interconnect_0_timer_s1_chipselect)                 //                                   .chipselect
	);

	AlarmClockHDL_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.sender_irq    (niosii_irq_irq)                  //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (niosii_debug_reset_request_reset),   // reset_in0.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
