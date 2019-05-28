/**
 * @file   uart.c
 *
 * @brief  lower level hardware interactions for uart on pi
 *
 * @date   10/1/17
 * @author David Yu <davidyu@andrew.cmu.edu>
 */

#include <kstdint.h>
#include <BCM2836.h>
#include <gpio.h>
#include <uart.h>

/** @brief GPIO UART RX pin */
#define RX_PIN 15
/** @brief GPIO UART TX pin */
#define TX_PIN 14

/** @brief AUXENB physical address */
#define AUXENB (volatile uint32_t *) (MMIO_BASE_PHYSICAL+0x215004) 
/** @brief AUX_MU_IO_REG physical address */
#define AUX_MU_IO_REG (volatile uint32_t *) (MMIO_BASE_PHYSICAL+0x215040)
/** @brief AUX_MU_IER_REG physical address */
#define AUX_MU_IER_REG (volatile uint32_t *) (MMIO_BASE_PHYSICAL+0x215044)
/** @brief AUX_MU_IIR_REG physical address */
#define AUX_MU_IIR_REG (volatile uint32_t *) (MMIO_BASE_PHYSICAL+0x215048)
/** @brief AUX_MU_LCR_REG physical address */
#define AUX_MU_LCR_REG (volatile uint32_t *) (MMIO_BASE_PHYSICAL+0x21504C)
/** @brief AUX_MU_CNTL_REG physical address */
#define AUX_MU_CNTL_REG (volatile uint32_t *) (MMIO_BASE_PHYSICAL+0x215060)
/** @brief AUX_MU_BAUD_REG physical address */
#define AUX_MU_BAUD_REG (volatile uint32_t *) (MMIO_BASE_PHYSICAL+0x215068)



void uart_init(void) {

    gpio_set_pull(RX_PIN,GPIO_PULL_DISABLE);
    gpio_set_pull(TX_PIN,GPIO_PULL_DISABLE);

    gpio_config(RX_PIN,GPIO_FUN_ALT5);
    gpio_config(TX_PIN,GPIO_FUN_ALT5);

    *AUXENB= 0x1; //for enabling miniUART
    *AUX_MU_IER_REG = 0x0;//do not enable interrupts
    *AUX_MU_IIR_REG = *AUX_MU_IIR_REG | 0x6;//mask the 1st and 2nd bits
    *AUX_MU_LCR_REG = 0x3;//need to set 0th and 1st bit to 1, set to 8-bit mode
    *AUX_MU_CNTL_REG = 0x3; //enable recieve/send
    *AUX_MU_BAUD_REG = 0x10E;// baudrate_reg from equation

}


void uart_close(void) {
    *AUXENB = 0x0;//disable miniUART
}


void uart_put_byte(uint8_t byte) {
    while(1) {
        if ((*AUX_MU_IIR_REG & 0x6) == 0x2){
            break;
        }
    }//loop until can be put
    *AUX_MU_IO_REG = byte;
}


uint8_t uart_get_byte(void) {
    while(1) {
        if((*AUX_MU_IIR_REG & 0x6) == 0x4) {
            break;
        }
    }//loop until can be got
    return (*AUX_MU_IO_REG & 0Xff);
}
