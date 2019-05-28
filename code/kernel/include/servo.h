/**
 * @file   servo.h
 *
 * @brief  software servo driver
 *
 * @date   September 22, 2017
 * @author Aaron Perley <aperley@andrew.cmu.edu>
 */

#ifndef _SERVO_H_
#define _SERVO_H_

#include <kstdint.h>

/**
 * @brief initialize the software servo driver
 * 
 * @note this funtion must be called before any other servo driver function
 */
void servo_init();

/**
 * @brief turn servo output on or off on a given channel
 *
 * @param channel  servo channel (1 or 2)
 * @param enabled  true to enable the channel, false to disable the channel
 */
void servo_enable(uint8_t channel, uint8_t enabled);

/**
 * @brief set servo to a given angle
 * 
 * @param channel  servo channel (1 or 2)
 * @param angle    servo angle in degrees (0 to 180)
 */
void servo_set(uint8_t channel, uint8_t angle);

#endif /* _SERVO_H_ */
