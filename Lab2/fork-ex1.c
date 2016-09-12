#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

void count (int start, char ch);

int main (int argc, char *argv[]) {
  int pid;
  int start = 0;

  pid=fork();             /* fork a child process */
  if (pid > 0) {          /* parent continues here */
    system("ps -el");
    count(start, 'P');
    wait(NULL);           /* to get all printing done before shell prompt shows*/
  } else if (pid == 0) {  /* child got here! */
    system("ps -el");
    count(start, 'C');
  } else {                /* only if there was a problem with fork */
    printf("Failed to fork a process \n");
    exit(-1);
  }
}

void count (int start, char ch) {
  int i, j;
  for (i = start; i < 10; i++) {
    for (j = 0; j < 1000000; j++);   /* delay */
    printf("Message from %c at the %dth iteration\n", ch, i);
  }
}
