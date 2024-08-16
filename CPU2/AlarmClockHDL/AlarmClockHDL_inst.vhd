	component AlarmClockHDL is
		port (
			alarm1_export   : in  std_logic                    := 'X'; -- export
			button1_export  : in  std_logic                    := 'X'; -- export
			button2_export  : in  std_logic                    := 'X'; -- export
			button3_export  : in  std_logic                    := 'X'; -- export
			button4_export  : in  std_logic                    := 'X'; -- export
			buzzer_export   : out std_logic_vector(1 downto 0);        -- export
			clk_clk         : in  std_logic                    := 'X'; -- clk
			segment1_export : out std_logic_vector(6 downto 0);        -- export
			segment2_export : out std_logic_vector(6 downto 0);        -- export
			segment3_export : out std_logic_vector(6 downto 0);        -- export
			segment4_export : out std_logic_vector(6 downto 0)         -- export
		);
	end component AlarmClockHDL;

	u0 : component AlarmClockHDL
		port map (
			alarm1_export   => CONNECTED_TO_alarm1_export,   --   alarm1.export
			button1_export  => CONNECTED_TO_button1_export,  --  button1.export
			button2_export  => CONNECTED_TO_button2_export,  --  button2.export
			button3_export  => CONNECTED_TO_button3_export,  --  button3.export
			button4_export  => CONNECTED_TO_button4_export,  --  button4.export
			buzzer_export   => CONNECTED_TO_buzzer_export,   --   buzzer.export
			clk_clk         => CONNECTED_TO_clk_clk,         --      clk.clk
			segment1_export => CONNECTED_TO_segment1_export, -- segment1.export
			segment2_export => CONNECTED_TO_segment2_export, -- segment2.export
			segment3_export => CONNECTED_TO_segment3_export, -- segment3.export
			segment4_export => CONNECTED_TO_segment4_export  -- segment4.export
		);

