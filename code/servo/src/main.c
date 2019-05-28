/**
 * @file   main.c
 *
 * @brief  Testing the syscalls
 *
 * @date   10/16/17
 * @author David Yu <davidyu@andrew.cmu.edu>
 */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <349libc.h>

/**
 * @brief User main function.
 * 
 */
int main(void) {
    char word[] = "write ";
    char word2[]="";
    write(1,word,6);
    read(0,word2,5);
    write(1,word2,5);
    printf(" printf\n");
  return 0;
}

