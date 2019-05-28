/**
 * @file   syscalls.h
 *
 * @brief  Syscall handlers, used by kernel's SWI handler.
 *
 * @date   September 26, 2015
 * @author Kenneth Li <kyli@andrew.cmu.edu>
 */

#ifndef _SYSCALLS_H_
#define _SYSCALLS_H_

#include <kstdint.h>

/**
 * @brief See linux man page for sbrk
 *
 * @param incr  amount to increment data segment size by.
 * @return -1 if error, or the previous end address of the heap
 */
void *syscall_sbrk(int incr);

/**
 * @brief See linux man page for write
 *
 * @param file  file descriptor to write to. In our kernel, we only support STDOUT.
 * @param ptr   pointer to buffer to write to
 * @param len   max length to write
 * @return -1 on error, otherwise the number of bytes written
 */
int syscall_write(int file, char *ptr, int len);

/**
 * @brief See linux man page for close.
 * Since we only read/write to stdin/stdout, close doesn't really do anything.
 *
 * @param file  file descriptor to close.
 * @return -1 on error, 0 on success.
 */
int syscall_close(int file);

/**
 * @brief See linux man page for fstat.
 * Since we don't have a file system, this doesn't actually do anything.
 *
 * @param file file descriptor to examine
 * @param st   pointer to stat structure
 * @return -1 on error, 0 on success
 */
int syscall_fstat(int file, void *st);

/**
 * @brief See linux man page for isatty.
 * Our implementation always returns TRUE since we only use stdin and stdout
 *
 * @param file  file descriptor to check.
 * @return boolean (1 or 0) indicating whether the fd is a tty
 */
int syscall_isatty(int file);

/**
 * @brief See linux man page for lseek.
 * Not implemented in our kernel since we don't have a filesystem.
 *
 * @param file  file descriptor
 * @param offset  offset
 * @param whence  see man page for appropriate values
 * @return -1 on error, 0 on success
 */
int syscall_lseek(int file, int offset, int whence);

/**
 * @brief See linux man page for read.
 *
 * @param file  file descriptor to read from. In our kernel, we only support STDIN.
 * @param ptr   pointer to buffer to read from
 * @param len   max length to read
 * @return -1 on error, otherwise number of bytes read
 */
int syscall_read(int file, char *ptr, int len);

/**
 * @brief Print out the exit status of the user program and hang with interrupts
 *        disabled (this is different behavior than the Linux man pages!)
 *
 * @param status Exit status to return to the kernel
 */
void syscall_exit(int status);

/**
 * @brief Enable or disable servo motor control
 *
 * @param channel  channel to enable or disable
 * @param enabled  true to enable, false to disable
 *
 * @return 0 on success or -1 on failure
 */
int syscall_servo_enable(uint8_t channel, uint8_t enabled);

/**
 * @brief Set a servo motor to a given position
 *
 * @param channel   channel to control
 * @param angle     servo angle in degrees (0-180)
 *
 * @return 0 on success or -1 on failure
 */
int syscall_servo_set(uint8_t channel, uint8_t angle);

#endif /* _SYSCALLS_H_ */
