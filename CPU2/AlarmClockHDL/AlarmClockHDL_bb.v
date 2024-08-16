
module AlarmClockHDL (
	alarm1_export,
	button1_export,
	button2_export,
	button3_export,
	button4_export,
	buzzer_export,
	clk_clk,
	segment1_export,
	segment2_export,
	segment3_export,
	segment4_export);	

	input		alarm1_export;
	input		button1_export;
	input		button2_export;
	input		button3_export;
	input		button4_export;
	output	[1:0]	buzzer_export;
	input		clk_clk;
	output	[6:0]	segment1_export;
	output	[6:0]	segment2_export;
	output	[6:0]	segment3_export;
	output	[6:0]	segment4_export;
endmodule
