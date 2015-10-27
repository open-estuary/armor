/* Example of use of fork system call */
#include <stdio.h>
#include <string.h>
// Required by for routine
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
 
main()
{
  int pid;
 
  pid = fork();
 
  if (pid < 0) { // error occurred 
	  fprintf(stderr, "Fork failed!\n");
	  exit(-1);
  }else if (pid == 0) { // child process 
	  printf("inside child process, return from fork=%d\n", pid);
	  execlp("/bin/ps", "ps", NULL);
          exit(0);
  }else { // parent process 
	  printf("inside parent process, return from fork, child pid=%d\n", pid);
	  printf("Parent exiting!\n");
	  exit(0);
  }
}

