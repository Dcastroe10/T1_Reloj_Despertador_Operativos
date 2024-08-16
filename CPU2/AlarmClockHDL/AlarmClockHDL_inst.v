module AlarmClockHDL_inst (
input 
clk,
reset,
button1,
button2,
button3,
button4,
alarm1,

output [1:0] buzzer,
output [6:0] segment1,
output [6:0] segment2,
output [6:0] segment3,
output [6:0] segment4




);

	AlarmClockHDL u0 (
		.alarm1_export   (alarm1),   //   alarm1.export
		.button1_export  (button1),  //  button1.export
		.button2_export  (button2),  //  button2.export
		.button3_export  (button3),  //  button3.export
		.button4_export  (button4),  //  button4.export
		.buzzer_export   (buzzer),   //   buzzer.export
		.clk_clk         (clk),         //      clk.clk
		.segment1_export (segment1), // segment1.export
		.segment2_export (segment2), // segment2.export
		.segment3_export (segment3), // segment3.export
		.segment4_export (segment4)  // segment4.export
	);

endmodule
