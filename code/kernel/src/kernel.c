/**
 * @file   kernel.c
 *
 * @brief  entry point to the raspberry pi kernel
 *
 * @date   10/12/17
 * @author David Yu <davidyu@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <timer.h>
#include <printk.h>
#include <arm.h>
#include <uart.h>
#include <supervisor.h>
#include <BCM2836.h>
#include <swi_num.h>
#include <syscalls.h>

/** @brief IRQ basic pending register physcial address */
#define IRQ_BASIC_PENDING (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0xB200)

/** @brief enable basic IRQs register physical address */
#define ENABLE_BASIC_IRQS (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0xB218)

/** @brief disable basic IRQs register physical address */
#define DISABLE_BASIC_IRQS (volatile uint32_t *) (MMIO_BASE_PHYSICAL + 0xB224)

/**
 * @brief The kernel entry point
 */
void kernel_main(void) {
    uart_init();
    install_interrupt_table();
    timer_start(1000);
    enable_interrupts();
    *ENABLE_BASIC_IRQS = 0x1;
    enter_user_mode();
    while (1) {
    // TODO: fill me out
  }
}


/**
 * @brief Handler called when an IRQ occurs
 */
void irq_c_handler(void) {
    //printk("IRQ!"); //this is used for checkpoint
    if(timer_is_pending()) {
        timer_clear_pending();
    }
  return;
}


/**
 * @brief Handles the given swi_num
 *
 * @param swi_num the swi number passed in from swi_asm_handler
 * @param args pointer to arguments array, set up by the swi_asm_handler
 *
 * @return the return result of the syscall
 */
void *swi_c_handler(int swi_num, int *args) {
    switch(swi_num) {
        case SWI_SBRK:
            return (void*)syscall_sbrk(args[0]);
        case SWI_WRITE:
            return (void*)syscall_write(args[0], (char*) args[1], args[2]);
        case SWI_CLOSE:
            return (void*)syscall_close(args[0]);
        case SWI_FSTAT:
            return (void*)syscall_fstat(args[0],(void*) args[1]);
        case SWI_ISATTY:
            return (void*)syscall_isatty(args[0]);
        case SWI_LSEEK:
            return (void*)syscall_lseek(args[0], args[1], args[2]);
        case SWI_READ:
            return (void*)syscall_read(args[0], (char*)args[1], args[2]);
        case SWI_EXIT:
            syscall_exit(args[0]);
            return (void*)0;
   
    /* Did not manage to get to these
        case SWI_SERVO_ENABLE:
            return
        case SWI_SERVO_SET:
            return*/

    }
    return (void*)0;
}
