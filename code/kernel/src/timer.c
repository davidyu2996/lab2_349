/**
 * @file   timer.c
 *
 * @brief  Implementation of routines for interacting with ARM timer
 *
 * @date   10/12/17
 * @author David Yu <davidyu@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <timer.h>
#include <BCM2836.h>



/** @brief timer load register physical address */
#define TIMER_LOAD (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0xB400)

/** @brief timer control register physical address */
#define TIMER_CONTROL (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0xB408)

/** @brief timer clear register physical address */
#define TIMER_CLEAR (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0xB40C)

/** @brief timer raw irq register physical address */
#define TIMER_RAW_IRQ (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0xB410)

/** @brief timer predevide value  register physical address */
#define TIMER_PREDIV (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0xB41C)




void timer_start(int freq) {

    *TIMER_CONTROL = 0xA2; //b1010010 enable timer, timer interrupt,32 bit counter
    *TIMER_LOAD = 1000*freq; 
    *TIMER_PREDIV = 0xF9; //249
  return;
}


void timer_stop(void) {
    *TIMER_CONTROL = 0x2; //disable timer/timer interrupt

  return;
}


int timer_is_pending(void) {
  return (*TIMER_RAW_IRQ == 0x1) ; //check to see if pending
}


void timer_clear_pending(void) {
    *TIMER_CLEAR = 0x1; // clear timer irq
  return;
}
