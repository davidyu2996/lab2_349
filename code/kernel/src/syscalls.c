/**
 * @file   syscalls.c
 *
 * @brief  Implementation of syscalls needed for newlib and 349 custom syscalls
 *
 * @date   10/16/17
 * @author David Yu <davidyu@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <uart.h>
#include <printk.h>
#include <arm.h>
#include <BCM2836.h>


/** @brief Global variable to keep track of where our heap ends */
char *heap_end = 0;

void syscall_exit(int status) {
    printk("%d", status);
    disable_interrupts();
    while(1) {}
    return;
}


int syscall_write(int file, char *ptr, int len) {
    if (file != 1) {
        return -1;
    }
    int i;
    for(i=0; i< len; i++) {
        uart_put_byte(ptr[i]);
    }
    return i;
}


/**
 * Reads until all len bytes are read or newline/return is found.
 * Detects backspace and EOL characters and handles them appropriately.
 *
 * The idea is to mimic normal terminal reading input, that is,
 * if the user hits backspace it should erase the previously read character.
 */
int syscall_read(int file, char *ptr, int len) {
    if(file != 0) {
        return -1;
    }
    int count = 0;
    while(count < len){
        char val = uart_get_byte();
        if(val == 4) {//end of transmission character
            return count;
        }
        else if(val == 8 || val == 127) { 
        //for backspace/delete
            uart_put_byte('\b');
            uart_put_byte(' ');
            uart_put_byte('\b');
            count = count-1;
        }
        else if(val == 10 || val == 13) { //for new line
            ptr[count] = '\n';
            uart_put_byte('\n');
            return count+1;
        }
        else {
            uart_put_byte(val);
            ptr[count] = val;
            count = count+1;
        }
    }
    return count;
}

int syscall_servo_enable(uint8_t channel, uint8_t enabled) {
  return 0;
}

int syscall_servo_set(uint8_t channel, uint8_t angle) {
  return 0;
}

/*****************************************************************************/
/* TA system call implementations:                                           */
/*****************************************************************************/

void *syscall_sbrk(int incr) {
  extern char __heap_low; // Defined by the linker
  extern char __heap_top; // Defined by the linker
  char *prev_heap_end;

  if (heap_end == 0) {
    // Initialize heap_end if this is the first time sbrk was called
    heap_end = &__heap_low;
  }

  prev_heap_end = heap_end;
  if (heap_end + incr > &__heap_top) {
    // Heap and stack collision, return error
    return (void *) -1;
  }

  // update heap_end and return old heap_end
  heap_end += incr;
  return (void *) prev_heap_end;
}

int syscall_close(int file) {
  return -1;
}

int syscall_fstat(int file, void *st) {
  return 0;
}

int syscall_isatty(int file) {
  return 1;
}

int syscall_lseek(int file, int ptr, int dir) {
  return 0;
}
