/* 
 * "Small Hello World" example. 
 * 
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example 
 * designs. It requires a STDOUT  device in your system's hardware. 
 *
 * The purpose of this example is to demonstrate the smallest possible Hello 
 * World application, using the Nios II HAL library.  The memory footprint
 * of this hosted application is ~332 bytes by default using the standard 
 * reference design.  For a more fully featured Hello World application
 * example, see the example titled "Hello World".
 *
 * The memory footprint of this example has been reduced by making the
 * following changes to the normal "Hello World" example.
 * Check in the Nios II Software Developers Manual for a more complete 
 * description.
 * 
 * In the SW Application project (small_hello_world):
 *
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 * In System Library project (small_hello_world_syslib):
 *  - In the C/C++ Build page
 * 
 *    - Set the Optimization Level to -Os
 * 
 *    - Define the preprocessor option ALT_NO_INSTRUCTION_EMULATION 
 *      This removes software exception handling, which means that you cannot 
 *      run code compiled for Nios II cpu with a hardware multiplier on a core 
 *      without a the multiply unit. Check the Nios II Software Developers 
 *      Manual for more details.
 *
 *  - In the System Library page:
 *    - Set Periodic system timer and Timestamp timer to none
 *      This prevents the automatic inclusion of the timer driver.
 *
 *    - Set Max file descriptors to 4
 *      This reduces the size of the file handle pool.
 *
 *    - Check Main function does not exit
 *    - Uncheck Clean exit (flush buffers)
 *      This removes the unneeded call to exit when main returns, since it
 *      won't.
 *
 *    - Check Don't use C++
 *      This builds without the C++ support code.
 *
 *    - Check Small C library
 *      This uses a reduced functionality C library, which lacks  
 *      support for buffering, file IO, floating point and getch(), etc. 
 *      Check the Nios II Software Developers Manual for a complete list.
 *
 *    - Check Reduced device drivers
 *      This uses reduced functionality drivers if they're available. For the
 *      standard design this means you get polled UART and JTAG UART drivers,
 *      no support for the LCD driver and you lose the ability to program 
 *      CFI compliant flash devices.
 *
 *    - Check Access device drivers directly
 *      This bypasses the device file system to access device drivers directly.
 *      This eliminates the space required for the device file system services.
 *      It also provides a HAL version of libc services that access the drivers
 *      directly, further reducing space. Only a limited number of libc
 *      functions are available in this configuration.
 *
 *    - Use ALT versions of stdio routines:
 *
 *           Function                  Description
 *        ===============  =====================================
 *        alt_printf       Only supports %s, %x, and %c ( < 1 Kbyte)
 *        alt_putstr       Smaller overhead than puts with direct drivers
 *                         Note this function doesn't add a newline.
 *        alt_putchar      Smaller overhead than putchar with direct drivers
 *        alt_getchar      Smaller overhead than getchar with direct drivers
 *
 */

#include "sys/alt_stdio.h"
#include <stdio.h>
#include <system.h>
#include <altera_avalon_timer_regs.h>
#include <sys/alt_irq.h>

//Memory direction for each input and output


    volatile unsigned short * segment1 = (short *) 0x000210b0;
    volatile unsigned short * segment2 = (short *) 0x00021080;
    volatile unsigned short * segment3 = (short *) 0x00021090;
    volatile unsigned short * segment4 = (short *) 0x000210a0;
    volatile unsigned short * button1 = (short *) 0x00021020;
    volatile unsigned short * button2 = (short *) 0x00021030;
    volatile unsigned short * button3 = (short *) 0x00021040;
    volatile unsigned short * button4 = (short *) 0x00021050;
    volatile unsigned short * alarm1 = (short *) 0x00021060;
    volatile unsigned short * buzzer = (short *) 0x00021070;


    int seconds,  hours , minutes, indx, debounce, state ,isAlarmOn, aHours,aMinutes;

    static void timer_isr(void * context, alt_u32 id);

//converts a character of a number into its 7 segment 7 bits equivalent
int intTo7segment(char number){

	switch (number) {
	  case '0':
	      return 0b1000000;
	    break;
	  case '1':
		  return 0b1111001;
	    break;
	  case '2':
		  return 0b0100100;
	  	    break;
	  case '3':
		  return 0b0110000;
	  	    break;
	  case '4':
		  return 0b0011001;
	  	    break;
	  case '5':
		  return 0b10010010;
	  	    break;
	  case '6':
		  return 0b0000010;
	  	    break;
	  case '7':
		  return 0b1111000;
	  	    break;
	  case '8':
		  return 0b10000000;
	  	    break;
	  case '9':
		  return 0b0010000;
	  	    break;

	  default:
	    return 0b1111111;
	}

}

void displayHour(int hour, int minute){




	char hStr[3] ;
	char mStr[3] ;

	sprintf(hStr,"%d",hour);
	sprintf(mStr,"%d",minute);


	*segment1 = intTo7segment(mStr[1]);
	*segment2 = intTo7segment(mStr[0]);
	*segment3 = intTo7segment(hStr[1]);
	*segment4 = intTo7segment(hStr[0]);

}



void init_timer_interrupt(void ){


	alt_ic_isr_register(TIMER_IRQ_INTERRUPT_CONTROLLER_ID,TIMER_IRQ, (void *)timer_isr,NULL,0x0);

	IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_BASE, ALTERA_AVALON_TIMER_CONTROL_CONT_MSK
			| ALTERA_AVALON_TIMER_CONTROL_START_MSK
			| ALTERA_AVALON_TIMER_CONTROL_ITO_MSK );
}



static void timer_isr(void * context, alt_u32 id){

	static int count = 0;


	IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_BASE,0);

	if(count%4 == 0){
			seconds++;
			checkClock();


		}
	if(debounce != 0){
			debounce--;
	}


	//displayHour(hours,minutes);
	printf("\nTimer expired: %d",count++);



}

void checkAlarm(){
	if(hours == aHours && minutes == aMinutes){
		*buzzer = 0b10;
		printf("PimPom alarma");
	}else{
		;
	}
}

void checkClock(void){

	if(seconds >= 60){
		 minutes ++;
		 seconds = 0;
		 checkAlarm();
}
	else if (minutes >= 60){
		hours++;
		minutes = 0;

}
	else if (minutes < 0){
			hours--;
			minutes = 59;
}
	else if(hours >= 24){
		hours = 0;
}
	else if(hours < 0){
			hours = 23;
}
	displayHour(hours,minutes);


}


void sumIndex( int op){

	if(op == 0){

		switch(indx){
			case 0:
					minutes += 1;
					break;
			case 1:
					minutes += 10;
					break;
			case 2:
					hours += 1;
					break;
			case 3:
					hours += 10;
					break;

	}
	}
		else {


			switch(indx){
				case 0:
						minutes -= 1;
						break;
				case 1:
						minutes -= 10;
						break;
				case 2:
						hours -= 1;
						break;
				case 3:
						hours -= 10;
						break;
	}
	}

}

void sumIndexAlarm( int op){

	if(op == 0){

		switch(indx){
			case 0:
					aMinutes += 1;
					break;
			case 1:
					aMinutes += 10;
					break;
			case 2:
					aHours += 1;
					break;
			case 3:
					aHours += 10;
					break;

	}
	}
		else {


			switch(indx){
				case 0:
					aMinutes -= 1;
						break;
				case 1:
					aMinutes -= 10;
						break;
				case 2:
					aHours -= 1;
						break;
				case 3:
					aHours -= 10;
						break;
	}
	}


	if (aMinutes >= 60){
		aHours++;
		aMinutes = 0;
}
	else if (aMinutes < 0){
			aHours--;
			aMinutes = 59;
}
	else if(aHours >= 24){
		aHours = 0;
}
	else if(aHours < 0){
			aHours = 23;
}else{
	displayHour(aHours,aMinutes);
}
	displayHour(aHours,aMinutes);


}

void clockSetup(){
	indx = 0;
	int setup =1;

	printf("setting up the clock...");

	while(setup){

		if(debounce == 0){

		if(*button4 == 0){

			setup =0;
			debounce = 2;
			printf("setup finished");
			if(isAlarmOn){
				alarmSetup();
			}

		}
		else if(*button3 == 0){
			indx++;
			debounce = 2;
			if(indx > 3){
				indx =0;
			}
		}
		else if(*button2 == 0){

			sumIndex( 1);
			debounce = 2;
			checkClock();
				}
		else if(*button1 == 0){

			sumIndex( 0);
			debounce = 2;
			checkClock();
			}
		}
		else{
			checkClock();
		}

	}

}




void alarmSetup(){
		indx = 0;
		int setup =1;
		if(isAlarmOn ==0){
			aHours = hours;
			aMinutes = minutes;
			isAlarmOn = 1;

		}


		printf("setting up the Alarm");

			while(setup){

					if(debounce == 0){

						if(*button4 == 0){

							setup =0;
							debounce = 2;

							printf("setup finished");

						}
						else if(*button3 == 0){
							indx++;
							debounce = 2;
							if(indx >= 4){
								indx =0;
							}

						}
						else if(*button2 == 0){

							sumIndexAlarm(  1);
							debounce = 2;
							displayHour(aHours,aMinutes);
								}
						else if(*button1 == 0){

							sumIndexAlarm( 0);
							debounce = 2;
							displayHour(aHours,aMinutes);
							}
						else{
							displayHour(aHours,aMinutes);
												}
						}else{
							displayHour(aHours,aMinutes);
						}


					}




}

int main()
{ 
  //alt_putstr("Hello from Nios II!\n");

	init_timer_interrupt();





  /* Event loop never exits. */


		hours = 0;
		minutes = 0;
		seconds = 0;
		debounce = 0;
		isAlarmOn = 0;
		*buzzer = 0b00;

		displayHour(hours,minutes);


  while (1){

	  if(debounce == 0){

	  if (*button4 == 0){
		  debounce = 2;
		  //printf("debounce2: %d",debounce);
		  clockSetup();


	    	  }
	  else if(*alarm1 != 0){

		  if(isAlarmOn==0){
			  alarmSetup();
			  isAlarmOn = 1;
			  debounce =2;
		  }

	  }else if(*alarm1 == 0){
		  isAlarmOn = 0;
		  *buzzer = 0b00;
	  }
	  }

	  checkClock();


  }
}
