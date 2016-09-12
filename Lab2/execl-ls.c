#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

void count (int start, char ch);

int main(int argc, char *argv[])
{
	int pid;
	int start=0;

	pid = fork();		/* fork a child process */

	if (pid > 0)		/* parent continues here  */
  {
		count (start, 'P');
   	wait (NULL);	/* to get printing done before shell prompt */
  }
 	else if ( pid == 0)     /* child got here */
	{
  	execlp ("/bin/ls", "ls", "-l", NULL);	/* execute ls command */
	}
	else                   /* there is a problem with fork */
  {
		printf (" Failed to Fork a Process\n");
  	exit (-1);
	}
}

void count (int start, char ch)
{
	int i, j;
	for (i = start; i < 10; i++)
	{
  	for ( j = 0; j < 100000000; j++);
   	printf ("Message from %c process at the %dth iteration \n", ch, i);
 	}
}
