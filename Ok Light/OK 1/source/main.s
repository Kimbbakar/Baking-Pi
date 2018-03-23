.section .init
.globl _start
_start:
 
ldr r0,=0x20200000

mov r1,#1
lsl r1,#21 /* NEW GPFSEL4 bit 21 to enable GPIO47 for out */

/*
* Set the GPIO function select.
*/
str r1,[r0,#0x10]

mov r1,#1
lsl r1,#15 /* NEW we want 15th bit for GPSET1 and GPCLR0 */

/* NEW
* Label the next line loop$ for the infinite looping
*/  

/*
* Set GPIO 47 to low, causing the LED to turn on.
*/
str r1,[r0,#0x20] /* NEW GPSET1 instead of GPSET0 */
 
loop$: 
b loop$
